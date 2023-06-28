Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DB2EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=866rJMLupAZ0FQ/AjN5swYnExP8VarjqgCKUyoaxkss=; b=U2wYcNoKeVCyJt
	FXk0YFAR5HrYdCm5EY25TA+3O1CCijnBYIHyIig7XB+poS/fmH4d+n+vH078Vuym6eACC+2A2AJHB
	PrKQRekbyFIaA3iUBUz0KKXtfSZSLZmgqYJtUm8wzB9CLcf4NpdCdCeUhj7XenB0J1PysdzIWtsk4
	5UHQAWhmqwagytxvs12MsLqN88CZ1UIdCdD99mnGe+bgfiyMUuocaieDnkO6rD5ZB1eCvJf0DWCpw
	9Y4xu4LgajqO4av0yKFPXT1Nv+KxXhSm/T+WNLz9FdQgCCNK6LVohXRPqKg51rV/hDEJpxHQEfBkq
	aGEZdeVv1jDiRp39NeBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUJe-00FdtY-0O;
	Wed, 28 Jun 2023 12:30:34 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUJb-00FdtC-05
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 12:30:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso5428633e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 05:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687955427; x=1690547427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8uELbaTBQBP7IMLX/PL59rLHYxkicVqZoxRVAK7TQmc=;
        b=VfNGdMyM7OeLVTTVyHyaXx9ZRvDc4b5asU+TytqUDH0ZZUXLREHvdAjjfWWfdor8+1
         Kryt9jxd/nT49bthEJz4d0P2z/23qTcPQ9lY73LIM5Kw3x1PSeun1wJSd1qVFjDzPqc5
         peVoDDhx8hDjTUetLhPzlRsH0g6qVrrTvAW/tVv5lbIeUsAg/ChJIinCvzsqAE+NNVFq
         tt+KyBvEwPMdSKrHQ2nO1phLqElLBDMJGLWRtkGZyqxHHGPn2M7S6IqUm0eGm6EYpMIo
         JioHaCc2v8kBMA6rBtP+PxbOwkGNP4W5mZ7NJjyuCGR36dQugRW9fTUzTGDvska2lE5i
         TgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687955427; x=1690547427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uELbaTBQBP7IMLX/PL59rLHYxkicVqZoxRVAK7TQmc=;
        b=AgQXIxZgJWkm8lPbkPcNXr+nHF23szsbN/qp6VSk6D7K4/OmHqHKdeKFF1HP9AafGJ
         KrnX/jPfDU7WCy53FAZG+xUGfSFIxLyIrth+v5hu13d/Tg39AWnMrxByJ6Cg0nIOJoyy
         VUWYVD5z3eHLH+E3uDm8X39adN11NZfQCdqf9er5rMZP/ua6TivJZIltREolyTRdGslH
         luHD62HbWuAG92bBUpmsUughd+w6/CFcV12iq8o0C1rvhIGqGlrvwRc7qzPdARKuYzSG
         uplbdjpJu/+v2KN13S1pqWBaYWfoFV6rgnGZ6Q1KO5IexHvHWhblSa1VuP5duuNdcB3Z
         qYNg==
X-Gm-Message-State: AC+VfDyLgo1E8ysPVHmGq6pvggoXyfn2Rj7ED9URVfzOhT0DgIjhse3m
	yal0/9Pr6v5V+DxzThy9IH3Emw==
X-Google-Smtp-Source: ACHHUZ7J+EyKCOqib+T5i+o3hRIRjIvVeJQPeKuhzBfsHMiztjXy8t0h8uOeQBlu2M+7kF9i1t3xtg==
X-Received: by 2002:a05:6512:39c4:b0:4f9:5a0c:85b8 with SMTP id k4-20020a05651239c400b004f95a0c85b8mr13796411lfu.36.1687955427192;
        Wed, 28 Jun 2023 05:30:27 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f8fac0ad4bsm13566299wml.17.2023.06.28.05.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 05:30:26 -0700 (PDT)
Date: Wed, 28 Jun 2023 14:30:24 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <ZJwn4HZ9KaB/q3Vt@vermeer>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
 <20230627-debating-twelve-da2c1ed60948@spud>
 <ZJwE5wRVkoND3Z6P@vermeer>
 <20230628-unfeeling-tavern-edd4f58396fa@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230628-unfeeling-tavern-edd4f58396fa@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_053031_083585_D666AB11 
X-CRM114-Status: GOOD (  22.34  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMTI6MTA6MTFQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgSnVuIDI4LCAyMDIzIGF0IDEyOjAxOjExUE0gKzAyMDAsIFNhbXVlbCBP
cnRpeiB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDA3OjQ4OjE1UE0gKzAxMDAs
IENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gT24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgMTE6MTQ6
MzBBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIEp1biAyNywgMjAy
MyBhdCA3OjM44oCvQU0gU2FtdWVsIE9ydGl6IDxzYW1lb0ByaXZvc2luYy5jb20+IHdyb3RlOgo+
IAo+ID4gPiA+IEl0IHdvdWxkIGJlIG5pY2UgdG8gY29uc29saWRhdGUgdGhlIG9uZXMgdG9nZXRo
ZXIgdGhhdCBzZWFyY2ggZm9yIGEKPiA+ID4gPiBzaW5nbGUgc3RyaW5nIGFuZCBzZXQgbXVsdGlw
bGUgYml0cywgdGhvdWdoIEkgZG9uJ3QgaGF2ZSBhbnkgc3VwZXIKPiA+ID4gPiBlbGVnYW50IGlk
ZWFzIGZvciBob3cgb2ZmIHRoZSB0b3Agb2YgbXkgaGVhZC4KPiA+ID4gCj4gPiA+IEkndmUgZ290
IGEgcmVmYWN0b3Igb2YgdGhpcyBjb2RlIGluIHByb2dyZXNzLCBkcm9wcGluZyBhbGwgb2YgdGhl
c2UKPiA+ID4gY29weS1wYXN0ZSBpbiBwbGFjZSBvZiBhIGxvb3AuIEl0IGNlcnRhaW5seSBsb29r
cyBtb3JlIGVsZWdhbnQgdGhhbgo+ID4gPiB0aGlzLCBidXQgaXQgd2lsbCBmYWxsIG92ZXIgYSBi
aXQgZm9yIHRoZXNlICJvbmUgc3RyaW5nIG1hdGNoZXMgbWFueQo+ID4gPiBleHRlbnNpb25zIiBj
YXNlcy4gU2VlIGhlcmU6Cj4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDYyNi10aGlldmluZy1qb2Nrc3RyYXAtZDM1ZDIwYjUz
NWM1QHdlbmR5Lwo+ID4gPiBNeSBpbW1lZGlhdGUgdGhvdWdodCBpcyB0byBhZGQgYW5vdGhlciBl
bGVtZW50IHRvIHJpc2N2X2lzYV9leHRfZGF0YSwKPiA+ID4gdGhhdCBjb250YWlucyAicGFyZW50
IiBleHRlbnNpb25zIHRvIGNoZWNrIGZvci4gU2hvdWxkIGJlIGZhaXJseSBkb2FibGUsCj4gPiA+
IEknbGwgd2hpcCBzb21ldGhpbmcgdXAgb24gdG9wIG9mIHRoYXQuLi4KPiA+IAo+ID4gTmljZSwg
YW5kIHRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiAKPiA+IFNob3VsZCBJIHdhaXQgZm9yIHlvdXIg
cmVmYWN0b3IgdG8gYmUgbWVyZ2VkIGJlZm9yZSBwdXNoaW5nIHRoaXMgb25lPwo+IAo+IEkgZG9u
J3Qga25vdy4gSSB0aGluayB0aGF0IHlvdSBzaG91bGQgY29udGludWUgb24gd2l0aCB5b3VyIHNl
cmllcyBoZXJlLAo+IGFuZCB3aGljaGV2ZXIgZ29lcyBpbiBzZWNvbmQgZ2V0cyByZWJhc2VkIG9u
IHRvcCBvZiB0aGUgb3RoZXIuCgpTb3VuZHMgZ29vZCB0byBtZSwgdGhhbmtzLgoKQ2hlZXJzLApT
YW11ZWwuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
