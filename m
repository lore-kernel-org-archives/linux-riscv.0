Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B962C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlCjD+9G8sxfR/FjShSCokT968qQB18qgE8P2M/idDc=; b=YPgodgitk50KfM
	gsPdnW3lWn0Ukm9m0sZrFH88BDezXF3iel5EQBAg9xnAD7dxICGkrdtEDRvBLkDB6uUsFdmlYVyaY
	Z7Trl7CJB/Qps/lYJR6dtUIAnLrTqi7/GJ6OvLCKwZELKhpaVb9u+RZDh7wMpfPgrkUPZJAj2IJfV
	+0j7UI+GcP7CkNJaiPr/tV6izbsXBfS7g5/Vy2X8W5jptAg8aio+XTSuv8bFEtkCwZmk+CxfHnHvc
	Lr9stjnTWYCDjRXat1g28B4I04VlMfLgW8RVYSv3CwC3b2U9xHAz/NsrztDkyYZVYAWvrsMZAcJzT
	R+0z3qeqZk9wr06k6CvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3hW-00000001qgs-2Nxh;
	Thu, 25 Jul 2024 19:00:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX3hO-00000001qbs-3Wx4
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 19:00:28 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so1736426a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2024 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721934021; x=1722538821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Odp82Bt/6lQT9q7XLZznJSSdvglIivq+nF5Svn4ptT0=;
        b=o0zhz4ROEvON2QWcPpZOq2zQ5ced3NVZyIgKX/JW2wWDnL3oRE7ecGBO0HKKnqxuqV
         hhKWwmoFK9VoIJZNhUQJJYchtiid/XucenpEn+Er60aFRNRZ3Pn4GcMfdcw2MjxBj4XH
         Uu8k7MViyq2y6sDJkkzNcPDMb30ksR0jfu9CoVWkjKgE+dBiCdaHiA9k/QakeYP3XU/T
         GqTrKDQ1KcgTL33V7g1w37jhWv/22fVle2oDrkRj6MUMFq43KuiaLxJdxrCjVWuCMary
         RN4LI64uxS09Zb5zy1BIQLYPfMT7o9pR7tvNKt/1lFdKD9MMbUTS2yTPQVbhwJ23vt+m
         XI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721934021; x=1722538821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Odp82Bt/6lQT9q7XLZznJSSdvglIivq+nF5Svn4ptT0=;
        b=wMLPebpXmuHYYdp3qELw1oo2LJ4uLfkz8dopd+g+wPlJTlG9UA441i0s+/+64ZInGZ
         aHTfNGq2hZqhcFPFC5L7n+COWHQC1gRZ7J/pH2t15r+W+3n4Jf2lG8BZ3XNkuQRTqFxG
         KtLfmXnKyYciUp0StxsubxlXkew7lbEZ21IFom4BDbw5haqColHrKKkakyavIW0fRlm9
         3c9yQblZVocE5IEuKhsuvctIdrC1CoxAOhWFXaIoFdPbMsZxJtYYJkioMsrPdUW9Sn+T
         3FjiYz/gQeg+FmnyOyjXO73UQmcir2Xl1AxQsRkIeXXWlwTBaDUjQC8BvXFaQC1xAr5z
         skWA==
X-Gm-Message-State: AOJu0YwnKMVh4ti/nzN47LLcQXiFwD1+cZ745GhG8O3Pz5A3walihKjO
	UOJw7VeCTx50v/p40P/s9mPtlRGnldgax5kIPLVlwK3PUhPmVhiDutu/NxWlbPcIXD3x04VuR07
	p6fpQz5QfQdd74AR80rwsRG85jIViIGX5j1V75A==
X-Google-Smtp-Source: AGHT+IHDvkKcJD4Ik/iost4JLdfIAMZE785wfXdt7jij5gd0w5caXSBtwl0brqZnk6WI+gW1KzKa1dQRWmFciMLLxGA=
X-Received: by 2002:a17:907:93d6:b0:a72:40b4:c845 with SMTP id
 a640c23a62f3a-a7ac50641dcmr215221666b.51.1721934021027; Thu, 25 Jul 2024
 12:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240724183605.4038597-1-jesse@rivosinc.com> <20240724183605.4038597-6-jesse@rivosinc.com>
In-Reply-To: <20240724183605.4038597-6-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 25 Jul 2024 11:59:44 -0700
Message-ID: <CALs-HsuW+p4KsR0GiOT5OpFVNB6CL23hJd2r6qgu2Ff7dhfRLQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_120022_909027_ADF6A58C 
X-CRM114-Status: UNSURE (   7.97  )
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

T24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgMTE6MzbigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFJlcGxhY2UgUklTQ1ZfTUlTQUxJR05FRCB3aXRoIFJJU0NW
X1NDQUxBUl9NSVNBTElHTkVEIHRvIGFsbG93Cj4gZm9yIHRoZSBhZGRpdGlvbiBvZiBSSVNDVl9W
RUNUT1JfTUlTQUxJR05FRCBpbiBhIGxhdGVyIHBhdGNoLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVz
c2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5r
aW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFu
QHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
