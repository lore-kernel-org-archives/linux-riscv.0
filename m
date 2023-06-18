Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B4BEB64DB
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qtQFtJODn1r6hrQtyWV0U7iH2rq4a+o3WbcR4UgDio=; b=DvjFDOXUDmIvyU
	F6Z1QPibzcwOCK56AqTe9vevGUMGYVSp2pkebgr616uUkILayxIK3J39sYYUwJhYX/Uh//6Az0L1K
	0IpBSA3WfKzGsUMlH84xctsKf5XP4UVAmTaQrmbqSL9Mek4AhkULpmeC5+QN4s8y+t+vB3i6eNRBE
	zJxuRJBgaF53f7z6Rq4WK/a6PDuYPeaSMn/xvYhiqp4SIqt531PfG0ZLF9GUwtdpUhJN2PMaQ65A9
	QL5Y29Kwy5J3c5ft1TsSX594OrMjY0weYvpASCPzoyV6UZsP8MS1V0jmFX+GyPTBKjQWEhpaAzEdc
	ViCoS7jBlsaZkM6nSLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAurg-006DSJ-1r;
	Sun, 18 Jun 2023 16:02:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAurd-006DRB-37
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jun 2023 16:02:55 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98802908fedso158092566b.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jun 2023 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687104171; x=1689696171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRbzBkciEPo/VwBwcSi1eZcepCh3WEZDv0XNNTPYER8=;
        b=PwMG1rS/T0zMkIJb0NktFrkHaDuOvE9rVTTXi9SygbdwcNq1MkZ5ogL981oWNKxdXB
         bPEuLwf7V8KhrkfNCB1j80iuxZfgdfdHTOVhMjAO1pzhoAnTITzRI47jJTMa/Q64FOu6
         y0Zg5JYwUsRJm7pszI1pnT7RkboXvX6MJ/MpHx+7ppzDY37ZsW3uMNNGdJVQ3PZCjdh4
         Qh0BrbGStI3AY2gdMu3Q4QtL07Mf+PwbWvbUoU3qYVwKpdWbntLaTwnx/cqP5LhdlzsN
         0AMROUj/kAvNMWN2yL7AV5oxBpCFC1R/YRGyX+5vxFdmHMroh/nu3NhGcD1fql/xWfQS
         rNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687104171; x=1689696171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRbzBkciEPo/VwBwcSi1eZcepCh3WEZDv0XNNTPYER8=;
        b=RWvPj4xMN8TAgyPNGdc03OLbFaRY23sFC453kLi8qnQ00qIQ1F9InnMBdyGluX7V9r
         TPmDLCHIaMFF/q0LfCaz9TOO0kwVAcUjOwxQXMO2h1QaZQTo6oQWvcbkULUTr8BXp/FI
         3rcWuMZ9wNMujq+Cqbm4EsfXrAAH01WLWgTqpQXvm1rr4ZiNgnUallWVGSbdk0hk6NXd
         R8dQX77weAXMmzuuf0kdenF49t/99HhvrfX3UcarkYWkALlnf/DsDySOUwWKd5rM9ibE
         Gynr7j8n/dzPr1ajgNyv/shg6CMqSv4ZmezEDEYxw6lIOphhZu/80GGX807N0buXCyuR
         Eq/A==
X-Gm-Message-State: AC+VfDzqiCThjFWfeNkT5BBq3ugWbnuM+Mfj+5ZnqNY6Vlsi4Gd9otOL
	Aws07Xtcm7cyHINTEMFoK5LyGZNfq9G4migMl3/1yw==
X-Google-Smtp-Source: ACHHUZ76bSKd7iFZYOKBq6Bi4aoQhk/ver2w1iruH0Fe1LaOVqdlt/rdgLfTiLHof5C57D4/VPNytqb4y52AGQTHTDg=
X-Received: by 2002:a17:907:8a08:b0:987:ae30:4b8c with SMTP id
 sc8-20020a1709078a0800b00987ae304b8cmr4476266ejc.70.1687104171484; Sun, 18
 Jun 2023 09:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 18 Jun 2023 21:32:39 +0530
Message-ID: <CAAhSdy2Hb7aMbOdw12GZCtZCc0WcJn3-hxZmvgpMfmYhuZs-EQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: kvm: define vcpu_sbi_ext_pmu in header
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	atishp@atishpatra.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_090254_108112_5F473D4F 
X-CRM114-Status: GOOD (  16.68  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgNzo1MuKAr1BNIEJlbiBEb29rcyA8YmVuLmRvb2tzQGNv
ZGV0aGluay5jby51az4gd3JvdGU6Cj4KPiBTcGFyc2UgaXMgZ2l2aW5nIGEgd2FybmluZyBhYm91
dCB2Y3B1X3NiaV9leHRfcG11IG5vdCBiZWluZwo+IGRlZmluZWQsIHNvIGFkZCBhIGRlZmluaXRp
b24gdG8gdGhlIHJlbGV2YW50IGhlYWRlciB0byBmaXgKPiB0aGUgZm9sbG93aW5nOgo+Cj4gYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmM6ODE6Mzc6IHdhcm5pbmc6IHN5bWJvbCAndmNwdV9z
YmlfZXh0X3BtdScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KPgo+IEZp
eGVzOiBjYmRkYzRjNGNiOWUgKCJSSVNDLVY6IEtWTTogQWRkIFNCSSBQTVUgZXh0ZW5zaW9uIHN1
cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5j
by51az4KClF1ZXVlZCB0aGlzIGZvciA2LjUKClRoYW5rcywKQW51cAoKPiAtLS0KPiB2MjoKPiAg
IC0gY29ycmVjdCB0aGUgZml4ZXMgdGFnIGFzIHN1Z2dlc3RlZCBieSBDb25vciBEb29sZXkKPiAt
LS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8IDMgKysrCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCA0ICstLS0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBpbmRleCA0Mjc4MTI1YTM4YTUuLmI5NGM3ZTk1OGRhNyAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+IEBAIC02Niw0ICs2Niw3
IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9l
eHRfaHNtOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNw
dV9zYmlfZXh0X2V4cGVyaW1lbnRhbDsKPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9z
YmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF92ZW5kb3I7Cj4KPiArI2lmZGVmIENPTkZJR19SSVND
Vl9QTVVfU0JJCj4gK2V4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2
Y3B1X3NiaV9leHRfcG11Owo+ICsjZW5kaWYKPiAgI2VuZGlmIC8qIF9fUklTQ1ZfS1ZNX1ZDUFVf
U0JJX0hfXyAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IGluZGV4IGU1MmZkZTUwNDQzMy4uYzk3M2Q5MmEwYmE1
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaS5jCj4gQEAgLTIwLDkgKzIwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF92MDEgPSB7Cj4gIH07Cj4gICNl
bmRpZgo+Cj4gLSNpZmRlZiBDT05GSUdfUklTQ1ZfUE1VX1NCSQo+IC1leHRlcm4gY29uc3Qgc3Ry
dWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3BtdTsKPiAtI2Vsc2UKPiAr
I2lmbmRlZiBDT05GSUdfUklTQ1ZfUE1VX1NCSQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV92
Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3BtdSA9IHsKPiAgICAgICAgIC5leHRpZF9z
dGFydCA9IC0xVUwsCj4gICAgICAgICAuZXh0aWRfZW5kID0gLTFVTCwKPiAtLQo+IDIuMzkuMgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
