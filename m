Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A8EC54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifsJ8oTfLyoPA4W4VuHSClGHwr9LdwmLGcF+HQl21uo=; b=SR3PXav0TieybG
	uzjHyR/r+BKCYPqt8jbzePuszyDwbCfEk2MAqAftZpUumcJ8Mnm2r48rg6tC3lbU/UUImpfN4ATL7
	deK1duzG4T37viYqyJY2SrMc/XniqY+TxGJUcsi6IYVBezzJv1lR+4ZVjuqiQ3NhjndmLA30xeVBt
	CrvpEq8ZYtrMF29KSdP41Q0PesnCwRn3YgfzoWPmu6VrJb+kq1KIwkEnJsFK7pGnbaBM3zkIFV6Eb
	DgA5obJFzgTCoQXm4lyiTaTNtp+U6Z2hy2UOmOawHJ3xFfIr+JE8X/EL315BT9n68d/t8AgsLNqPN
	7bSMI9fXWor+9h7R9z6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE8k-00000002OO2-22l8;
	Thu, 21 Mar 2024 08:51:10 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE8g-00000002OLG-3JcY
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 08:51:08 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3c3ac720bceso246564b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711011065; x=1711615865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqNG2RpJPlr1g6cb+Y3gz6tpiaBtzhG+qVD6/FBVn0g=;
        b=EgGVE/ZyKroAPSbPrkXwRh+vaVzoaYuEifXBY7508/KmDsYX6ewCmY9rS5/USDwYqe
         63qlKX5HXgJAOlpkEXXkkpJD/cUnqzgfHYLF6wEb/qvpQjjqNoL4mNbGLQPtoXycIgFW
         iKcYBrmf7AgTpmCYA68t0dZs+03mJbDW4S9gLdZbI6Mqk25CZFnXP0vuig14y1eLTuGw
         oyjmih4V8bq7ZDiijxzuKW5FVWm745DE4MytaTB6fgdRgS0LzajpxjHDXR5CbklyGCiK
         yQYBOvUJ7sSru+E4qjsALD79Gaa+GsQnrF/2MlEfOgipjDmfLqixmGljoZoZrhBEGctN
         QiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711011065; x=1711615865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqNG2RpJPlr1g6cb+Y3gz6tpiaBtzhG+qVD6/FBVn0g=;
        b=XFh/ivi/vD5PvOPCFOZTKC6tmcR7qGfGtK+qpaOdVTASk0VajIQ6PRT48myrf8JHov
         9mJBlOL18ruNRe380AvLd0nGiOybH8IndKMOF2j8hLAM17hux/E+aL4gNcxhEbeiWb/L
         /HWT8ApRXDhD07HJbDMUKKFlxBI+xfkAq/De4rruh/NKVdi7u+b37WQhpJoHMDyIm8I0
         1HuYlW+EhBuwmx+ZeNDLtyz7BIzuYNZN+g7hKmKwV1GEiEUGF/2qdeVW/waDCVgePAtx
         0VU0U29BvO3ZH7WubNmVpq1bEVRZQEuaaidEWHcnHc85CumO53bmeYnicz4ThivtPQvO
         c/lw==
X-Forwarded-Encrypted: i=1; AJvYcCVgTs10mLALmGueV/1+SGKinQQ5pJugB9vHHnPfp8Xc4qsmcCOa1HQVWdb16TV7GlNaf6yC+HUh+0HXk3OqC1QbDnQx2SAqkVE5Umc2LRYq
X-Gm-Message-State: AOJu0YwY4G0SRm0+MthD9UWhLFRVoWklmnBBLB+s8S/X52NPFcsEiYKq
	2kXQg9aHZ2U0tZysGQFV8m8MPvUgeiG48IogrRaLkaCozm3QGsAhk3qYzZd0Dow=
X-Google-Smtp-Source: AGHT+IHwDM9ixAq9INkO3i418iZWmEpmXTd0fk8UuLCRGi37vLFEzQGRGixGXgfcb4sMkROFJd9img==
X-Received: by 2002:a05:6808:2102:b0:3c3:980d:3700 with SMTP id r2-20020a056808210200b003c3980d3700mr1825504oiw.8.1711011065475;
        Thu, 21 Mar 2024 01:51:05 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x3-20020a544003000000b003c3753dd869sm2275409oie.58.2024.03.21.01.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 01:51:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] RISC-V: KVM: Fix APLIC in_clrip[x] read emulation
Date: Thu, 21 Mar 2024 14:20:41 +0530
Message-Id: <20240321085041.1955293-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321085041.1955293-1-apatel@ventanamicro.com>
References: <20240321085041.1955293-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_015106_988776_7910652C 
X-CRM114-Status: GOOD (  11.05  )
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

VGhlIHJlYWRzIHRvIEFQTElDIGluX2NscmlwW3hdIHJlZ2lzdGVycyByZXR1cm5zIHJlY3RpZmll
ZCBpbnB1dCB2YWx1ZXMKb2YgdGhlIGludGVycnVwdCBzb3VyY2VzLgoKQSByZWN0aWZpZWQgaW5w
dXQgdmFsdWUgb2YgYW4gaW50ZXJydXB0IHNvdXJjZSBpcyBkZWZpbmVkIGJ5IHRoZSBzZWN0aW9u
CiI0LjUuMiBTb3VyY2UgY29uZmlndXJhdGlvbnMgKHNvdXJjZWNmZ1sxXeKAk3NvdXJjZWNmZ1sx
MDIzXSkiIG9mIHRoZQpSSVNDLVYgQUlBIHNwZWNpZmljYXRpb24gYXM6CgogICAgcmVjdGlmaWVk
IGlucHV0IHZhbHVlID0gKGluY29taW5nIHdpcmUgdmFsdWUpIFhPUiAoc291cmNlIGlzIGludmVy
dGVkKQoKVXBkYXRlIHRoZSByaXNjdl9hcGxpY19pbnB1dCgpIGltcGxlbWVudGF0aW9uIHRvIG1h
dGNoIHRoZSBhYm92ZS4KCkZpeGVzOiA3NDk2N2FhMjA4ZTIgKCJSSVNDLVY6IEtWTTogQWRkIGlu
LWtlcm5lbCBlbXVsYXRpb24gb2YgQUlBIEFQTElDIikKU2lnbmVkLW9mZi1ieTogQW51cCBQYXRl
bCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGlj
LmMgfCAyMSArKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9h
cGxpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKaW5kZXggNWU4NDJiOTJkYzQ2Li5i
NDY3YmE1ZWQ5MTAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCisrKyBi
L2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCkBAIC0xOTcsMTYgKzE5NywzMSBAQCBzdGF0aWMg
dm9pZCBhcGxpY193cml0ZV9lbmFibGVkKHN0cnVjdCBhcGxpYyAqYXBsaWMsIHUzMiBpcnEsIGJv
b2wgZW5hYmxlZCkKIAogc3RhdGljIGJvb2wgYXBsaWNfcmVhZF9pbnB1dChzdHJ1Y3QgYXBsaWMg
KmFwbGljLCB1MzIgaXJxKQogewotCWJvb2wgcmV0OwotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CisJ
dTMyIHNvdXJjZWNmZywgc20sIHJhd19pbnB1dCwgaXJxX2ludmVydGVkOwogCXN0cnVjdCBhcGxp
Y19pcnEgKmlycWQ7CisJdW5zaWduZWQgbG9uZyBmbGFnczsKKwlib29sIHJldCA9IGZhbHNlOwog
CiAJaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2lycXMgPD0gaXJxKQogCQlyZXR1cm4gZmFsc2U7CiAJ
aXJxZCA9ICZhcGxpYy0+aXJxc1tpcnFdOwogCiAJcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZpcnFk
LT5sb2NrLCBmbGFncyk7Ci0JcmV0ID0gKGlycWQtPnN0YXRlICYgQVBMSUNfSVJRX1NUQVRFX0lO
UFVUKSA/IHRydWUgOiBmYWxzZTsKKworCXNvdXJjZWNmZyA9IGlycWQtPnNvdXJjZWNmZzsKKwlp
ZiAoc291cmNlY2ZnICYgQVBMSUNfU09VUkNFQ0ZHX0QpCisJCWdvdG8gc2tpcDsKKworCXNtID0g
c291cmNlY2ZnICYgQVBMSUNfU09VUkNFQ0ZHX1NNX01BU0s7CisJaWYgKHNtID09IEFQTElDX1NP
VVJDRUNGR19TTV9JTkFDVElWRSkKKwkJZ290byBza2lwOworCisJcmF3X2lucHV0ID0gKGlycWQt
PnN0YXRlICYgQVBMSUNfSVJRX1NUQVRFX0lOUFVUKSA/IDEgOiAwOworCWlycV9pbnZlcnRlZCA9
IChzbSA9PSBBUExJQ19TT1VSQ0VDRkdfU01fTEVWRUxfTE9XIHx8CisJCQlzbSA9PSBBUExJQ19T
T1VSQ0VDRkdfU01fRURHRV9GQUxMKSA/IDEgOiAwOworCXJldCA9ICEhKHJhd19pbnB1dCBeIGly
cV9pbnZlcnRlZCk7CisKK3NraXA6CiAJcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlycWQt
PmxvY2ssIGZsYWdzKTsKIAogCXJldHVybiByZXQ7Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
