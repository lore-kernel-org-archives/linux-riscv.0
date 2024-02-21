Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC635C48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTCK8UpH+VXdgivDOG6Bjacp512c3GtBzj0iTNnz0Cg=; b=Jq1xFH1sMdUIqF
	rPItjGFmMHw1FLEDd8sWjYi4vAQrP/TDe71nnF+noab3fBvXhxal0eeV0xBt/XGwdLZ0d5U8fhgtS
	TfdZCqvxxNBOZD/ADRZFl9o7ReyWYydvUvpxWOcAKdHXTURRNGUfExUtRJTPTvywBDHOzXDZG1SED
	9W2lTc3pBhibDwLt4f1tdSQ/65Iei2gvgTYEJOVQDAY5Tu7SN3rmxqwjz/451zPiyfvslj2tHDOFp
	22OuUqhtDNhfVz938GmFFCIBwEZGrsETXjfg0T9PopcJs8WUkZZMDSRrnu6+2vosywvmU8YMgHJ8/
	IHFEGGz6aByNvd+NkEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmlc-000000015ly-3bLC;
	Wed, 21 Feb 2024 13:36:08 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcmlZ-000000015ku-49yG
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 13:36:07 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d22b8c6e0dso53348781fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 05:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708522564; x=1709127364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZa1EUK27qQ8Ow9XjJUdv9AmKUGFVXbnGB6joJ/bp7Q=;
        b=nfZHcouPVeHM17JafXboYJQ4h21dzy7WPdtJKgoiIJVgmUmbaIq36l07ZbXs9ww/Iq
         u/l+BPck7VyrYT8p/WJLpIPYgHoYDEQ0k0UYGsiDlxD13vhyrnZq+MmV//iS37ZXAH5S
         QwCKqBzWYVxNCyBkofbV2MlAlF93QBgStrlXRk5BVRhWi5AwfySUMpVLqFkJ6I0wVRDd
         rinhP92rlsYe/qNIDYXcSlBWBrUHxJPacyWpz2UXTSfZa5TNR4w8Qjcb5GPLnRbxqtFr
         XrM23ig4ei8+TotgdXFUTVs+CE3dVsHHsnwvLpgAaS5E4rLTEfVCbP4/LyvFR/WB+imd
         zzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522564; x=1709127364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZa1EUK27qQ8Ow9XjJUdv9AmKUGFVXbnGB6joJ/bp7Q=;
        b=JdBegNVCAcbRVQE0FzfToeH4QVfJHs0+wCtiD0kYiqi/s6lrm4nSnGHgXzpEW/QGRP
         y4nJ2FjREEUrPVVBNuHJGLDT6ops7gE30IvirTeyIXCRefLlzgrZ7LxIjPDcJcqlA2d9
         IoQ9TCne66UEFzF6YDRNq4f1XmT4GPwy0i1FuvxazL+qckHWskrkbBHyVPiVYVRSWDSW
         nZHvwz1c7gwURDzTWopttRbPwmKsxz03dVdPKJ+Kg6qLwN5ptf0Z1maCJLsGFi0RHV0P
         vexDJTRhdRwRSxX3b1u6FOl5L19DnAdPx1aSHkRVnlW+FDN+mWheNCCWDL11n1P6b9Ps
         VETQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi+sV+/kEIR0ROSheBiHkCKrRdVtL8xgdAcaNE+3yzpZgLym6ZKtt6CiHSaC9RkkSZ0IOF2AzIIoxdVWBBBaMftt8VQ6+VU+achWbKohnK
X-Gm-Message-State: AOJu0YzXJdny/ttqGMsg4hskbqA/4GXq6BCwwzuuyKdAsiU3BhdAMlBu
	CCFLfEXNsxdZIXC6tShZts/VVkGljOiIEqA1tLPYEwPLRSJesi1VSQuSQ7p+Z9e7YWoqIQYNvDt
	b13mqkCpaCm1nkZElWhV3rL3OPOAp7Fm0hgrvXw==
X-Google-Smtp-Source: AGHT+IH8PbfqK4LbbkaSU1nojq4bUVMOQpkZmRdtlm1F7WODSQlRTVfG1+cQD421y+B/I3PNrpXgs8sPl3SY+UGKWfs=
X-Received: by 2002:a2e:86d0:0:b0:2d2:3d1c:148f with SMTP id
 n16-20020a2e86d0000000b002d23d1c148fmr5452288ljj.42.1708522563808; Wed, 21
 Feb 2024 05:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-3-apatel@ventanamicro.com> <87frxnigxk.ffs@tglx>
In-Reply-To: <87frxnigxk.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 Feb 2024 19:05:52 +0530
Message-ID: <CAK9=C2VFksO054kVVHkrBRyZqte8Q4Gpup97VhLBRDCbOyQdqQ@mail.gmail.com>
Subject: Re: [PATCH v13 02/13] irqchip/sifive-plic: Improve locking safety by
 using irqsave/irqrestore
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_053606_055095_3229B0A3 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMzo0MeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIwIDIwMjQgYXQgMTE6MzcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiBOb3cgdGhhdCBQTElDIGRyaXZlciBpcyBwcm9iZWQgYXMgYSBy
ZWd1bGFyIHBsYXRmb3JtIGRyaXZlciwgdGhlIGxvY2sKPiA+IGRlcGVuZGVuY3kgdmFsaWRhdG9y
IGNvbXBsYWlucyBhYm91dCB0aGUgc2FmZXR5IG9mIGhhbmRsZXItPmVuYWJsZV9sb2NrCj4gPiB1
c2FnZToKPiA+Cj4gPiBbICAgIDAuOTU2Nzc1XSAgUG9zc2libGUgaW50ZXJydXB0IHVuc2FmZSBs
b2NraW5nIHNjZW5hcmlvOgo+ID4KPiA+IFsgICAgMC45NTY5OThdICAgICAgICBDUFUwICAgICAg
ICAgICAgICAgICAgICBDUFUxCj4gPiBbICAgIDAuOTU3MjQ3XSAgICAgICAgLS0tLSAgICAgICAg
ICAgICAgICAgICAgLS0tLQo+ID4gWyAgICAwLjk1NzQzOV0gICBsb2NrKCZoYW5kbGVyLT5lbmFi
bGVfbG9jayk7Cj4gPiBbICAgIDAuOTU3NjA3XSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiA+IFsgICAgMC45NTc3OTNdICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsb2NrKCZpcnFfZGVzY19sb2NrX2NsYXNzKTsKPiA+IFsgICAgMC45
NTgwMjFdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2NrKCZoYW5kbGVyLT5lbmFi
bGVfbG9jayk7Cj4gPiBbICAgIDAuOTU4MjQ2XSAgIDxJbnRlcnJ1cHQ+Cj4gPiBbICAgIDAuOTU4
MzQyXSAgICAgbG9jaygmaXJxX2Rlc2NfbG9ja19jbGFzcyk7Cj4gPiBbICAgIDAuOTU4NTAxXQo+
ID4gICAgICAgICAgICAgICAgICoqKiBERUFETE9DSyAqKioKPiA+Cj4gPiBUbyBhZGRyZXNzIGFi
b3ZlLCBsZXQncyB1c2UgcmF3X3NwaW5fbG9ja19pcnFzYXZlL3VubG9ja19pcnFyZXN0b3JlKCkK
PiA+IGluc3RlYWQgb2YgcmF3X3NwaW5fbG9jay91bmxvY2soKS4KPgo+IHMvbGV0J3MvLwoKT2th
eSwgSSB3aWxsIHVwZGF0ZS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
