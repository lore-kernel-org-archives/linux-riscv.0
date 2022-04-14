Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqZ3eAEwzDfY4lPhMPiVRoU1Ai1S3xCEHJNvxGDYxBI=; b=1lYJAZuIP8XvhZ
	F+7Q81n7fp+ijKuM2LLNiqz/NKgbRP6PoD6ba9pfavaiRK7/Ra6Nw0UhvEBfgzi7x930nFVHtnwnQ
	R6jVD+9a1ZRVXi5hCjukyiM/F9VstMMvDfqKLqvjacJEJhRwXddp+CVKgxWigcr6E6VK5xZx+0DDF
	TBw2usiYgJAEBxN43zuxGb3eoXCz5ouhq2k/8ucWAEuL22+bfgjnGclUL57cyTPSBgJ0GawMf5b0K
	uFQKVWGGQmdLg6Gvs8MqQBZq2HIvnYfh8mubbSWmigOBU+D3696vt3ofMkzNq/u0bd+YqQBGQy0oi
	5pPYRctCRO0PVVWdQYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf8sK-007mqR-19; Thu, 14 Apr 2022 23:27:44 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf8sH-007mq7-87
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 23:27:42 +0000
Received: by mail-pf1-x430.google.com with SMTP id j17so6100426pfi.9
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 16:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HmZzQaJcWVmRJdxQhHXzNCOEJRKn8oL9PGuKLwC4Vpk=;
 b=d1VKqQJQtATMIHplVI4UJ3GOGV6h5gR9y1TJbLwrVNFwoDKD6c3KLTeTwWyhfX1b6/
 bn2wbRksRbvFqps2Uu35fOeZnbu5K9rKtmY+viXPnznVSB3PctbOWHhOOVKsQHaCEU7B
 I4T6uDq4ftL4iKujE5TZsbCs9tuSrg5t8Ve7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HmZzQaJcWVmRJdxQhHXzNCOEJRKn8oL9PGuKLwC4Vpk=;
 b=tDGSHi5D7AzjPw3P5jl8fRgjj7ddiL64gf4o4jyN1LRYnKJ4au4OZI7xzLmmPeF+E/
 Kdj7cwty2zodJGtEFyi+/04n/vBogV+bndDrYIbY5umcMKJtYZUAHYlNXQ27NjPUG+nf
 ySJvPkm3X78/pXPz5REVHAw2F4KopN1t6UO0xue1RL74adtoEd7T0MlYA6E8EB3SSj2R
 RInIRrtarDCiyG3RgItodrJ5+Ek1XE/qwebDo+MAG3UJrJy4181S830WiQXCSBLgHuBf
 U5zsqmNcbyBXO/lNQFzyLG+lUVWGGLhK0si9Kz6SSDwXEG6qbm5XkBqwPiX7So8UcESB
 iaRA==
X-Gm-Message-State: AOAM533xyP+YzezlzJHhFKGDfd2XNfgngv8KtJC7VhyXTGBygSUotkmf
 9PvQnAuavXrX1bHy4NNWWsOryg==
X-Google-Smtp-Source: ABdhPJzq0A/ZN73+dcU0JnfCl1TVr6vkBK+NJGz++LvwQCH3lxWX0dgKyG5WwEKfaEtKzf1QfZl+4w==
X-Received: by 2002:a63:3e88:0:b0:39d:ae86:237d with SMTP id
 l130-20020a633e88000000b0039dae86237dmr4132709pga.360.1649978859862; 
 Thu, 14 Apr 2022 16:27:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a056a0000cc00b00508343a6f9esm902728pfj.5.2022.04.14.16.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 16:27:39 -0700 (PDT)
Date: Thu, 14 Apr 2022 16:27:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Niklas Cassel <niklas.cassel@wdc.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Message-ID: <202204141624.6689D6B@keescook>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414091018.896737-1-niklas.cassel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_162741_343586_8E0DC755 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMTE6MTA6MThBTSArMDIwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToKPiBiRkxUIGJpbmFyaWVzIGFyZSB1c3VhbGx5IGNyZWF0ZWQgdXNpbmcgZWxmMmZsdC4K
PiBbLi4uXQoKSG0sIHNvbWV0aGluZyBpbiB0aGUgY2hhaW4gYnJva2UgREtJTSwgYnV0IEkgY2Fu
J3Qgc2VlIHdoYXQ6CgogIOKclyBbUEFUQ0ggdjJdIGJpbmZtdF9mbGF0OiBkbyBub3Qgc3RvcCBy
ZWxvY2F0aW5nIEdPVCBlbnRyaWVzIHByZW1hdHVyZWx5IG9uIHJpc2N2CiAgICDinJcgQkFEU0lH
OiBES0lNL3dkYy5jb20KCktvbnN0YW50aW4sIGRvIHlvdSBoYXZlIGEgcHJvY2VzcyBmb3IgZGVi
dWdnaW5nIHRoZXNlPyBJIGRvbid0IHNlZSB0aGUKIm5vcm1hbCIgc3R1ZmYgdGhhdCBicmVha3Mg
REtJTSAoaS5lLiBhIHRyYWlsaW5nIG1haWxpbmcgbGlzdCBmb290ZXIsIGV0YykKCi0tIApLZWVz
IENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
