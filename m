Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D535AC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 19:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsEhdrtDbBmIHHo8U1d55gU8cSf/kLpFUUSPGSRqaXw=; b=ZzR5DWoX4n6zyd
	NOSCJDxveKhU9Tny7CkMNww5KomiaYP0N61vHkjjD0KrEt+dBjWtXkBNH0UTaVlXiL/NAHozpQ+nh
	8L8Zm7EW7pPCOcUzLwl8YZI0fe3j65l1OLi9fHPG34QMuajhNJcv/1uf7m17eudIh1Zqs0uco0Y9V
	SEe5TFq0Qtj6V0KIXwNsSOZiyeWPpJB68mFQpylq5Wr6ATkCYJUh86rttfzYaMXu96xHcoWKRkvGg
	8d/4SqGHP2vxXYEqnp2VIspossWCXJqe/PStBRjy6JQV8MU3TuBLhruqMEUTugzEmR8L8TqKuM7vC
	2mi4v3N8NAV5Ot9npCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUtjG-00000003gyR-1O51;
	Fri, 19 Jul 2024 19:57:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUtjD-00000003gxg-3Mxd
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 19:57:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a77e7a6cfa7so249310466b.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721419038; x=1722023838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPczUa5e3h8bDIU3taB7K6gYSZd2QQEpQ+m4m+73HB4=;
        b=ksr6KQf7JszfDcr0nX0hvtXCD+PbGx1H3PzCcBvbkUQpLTtwtRS7bBr+XSXwr0XRHD
         0fuyLs0OnMwfguqKj7PQWDuXadNfDFpcl/bb7tB40++Q051FNKeCaJO7VGUvD8996thp
         tMMzYFWoIXnOtxFAbYfCqh8pHjFstaZ76niEGhf1IamhZNN8tDJw1hgiahxoZNMongx4
         1TgfyW6QtL5A9ZNS6LALpUDrJsCajNBtbtb+icdh9bpO7ijEKIPpnJ4r57QNBUjiujIc
         6MIeoOqEX3QhJXSTR7e8mgIwtw5umvs02gOLTrgkx9pqa+dSKyjMQaIkAUMhQNNOFG11
         BiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721419038; x=1722023838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPczUa5e3h8bDIU3taB7K6gYSZd2QQEpQ+m4m+73HB4=;
        b=JsJrK/uhPPlRGgKTlCknzxcIGvL0pUkxSBqsalEaxPerwiNzkRh3uEyjyC5r5YhFPy
         6BJv2ybbD+3lMtLK/9yz9DYYrnSHBamIxvWB7QLPEJH03Sk0M+UQ1qQNmzvKimi1RY98
         dbJA+BoIFT9jL1SQTHcu+X8PcsHvV0CnGMb600v07+2euiaCstD6f1ZNMoRLJ7ave7sz
         arEaiOHiRNgcW6nNuGzgPfvfml6yXuUmu/c0fH7l3D2Bf6DSkbKIxH8PCYGPWUzJB93g
         ycA+yXkPE6UeOfPXcIgGv9WkBfN/1rLN0SPP9F5o/zpeBtDL+6LCgKGoExFAo1Tf1xR5
         qpwQ==
X-Gm-Message-State: AOJu0YzaznMs/GAftfS6lsqeSza4dXNig1PdMys1y/lXZqsbzFUZH8Df
	jpvJrwXn/60QwB8do7/RZcN4I8N0auYsoKSrWNB8TuUNnnpXVY4gzPiq/QKNg72q+066hlB2Beg
	bVumoCqsBBDo4fXHywIIWmV0ouBPoMrF21ZYZLw==
X-Google-Smtp-Source: AGHT+IFVF+CVdbaJkg3y+N7bCWjdUcp+1bJmmf0A4XaMnmetAxeY3PLap/EOWXN321STq9oPaIZpGUHPeCqe5U+TJJ4=
X-Received: by 2002:a17:906:2849:b0:a72:685b:7c98 with SMTP id
 a640c23a62f3a-a7a0119e3efmr641117366b.37.1721419038069; Fri, 19 Jul 2024
 12:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240717180727.4180475-1-jesse@rivosinc.com> <20240717180727.4180475-5-jesse@rivosinc.com>
In-Reply-To: <20240717180727.4180475-5-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 19 Jul 2024 12:56:42 -0700
Message-ID: <CALs-HsvWv+85EX2iFUgnZG7RdFndfn8WhVx_OB6ROPjzLKw+zg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
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
X-CRM114-CacheID: sfid-20240719_125719_863931_A403D219 
X-CRM114-Status: UNSURE (   7.74  )
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

T24gV2VkLCBKdWwgMTcsIDIwMjQgYXQgMTE6MDfigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
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
