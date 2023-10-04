Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51CAE7C4CB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZvQkhahcSpHuU+ecqxMi9uVLHs6w0NVw1G9pEY9YbA=; b=naLXagsPZOemE3
	uIm6NCeqsXv5j5rvzaO8m8JcK8kXlH7Yo8CfmYLyYyOgSsoQbii5hw62zwSOSyf0C1J1SkULPfdiR
	KijGzRl8yHye7seHLgcIPiAKpsciHjVIZkRyJKtzF0529k/nSNuaQHYvRKxUPBm4L6NgJ1QocFBQZ
	nFRblqEroin6FG4H/piQ3HLGDz5RgFoJWoD6+6doNjfjvoaZaN4u9BNwNEcHG3Ps0i9luFyb5tSfJ
	ctfsz1UQ4eJP7/vqWnioAb2k4eDFzESJZYraxVHZL+1HwaLFrHwRTYI0a8F/+/H7uirp9iJlWpUiw
	OUu964n/3V0yskSGN32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xh-000ENq-3C;
	Wed, 04 Oct 2023 14:34:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xe-000ELF-2J
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:34:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40646537450so5674145e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696430089; x=1697034889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyQJmck1/pI5OX/IX07IDtTyF+FKPIka6gVUOADEZr8=;
        b=1r8nhbXYoiNT1yjseo34YvIWC5c+uEtk04IJNIsk9sN3nSSlgbH5RnQIYbPVc67yUM
         p8uUb9nVFeyEnHCMtRitxAzn/lUgDNvcpbST3FuDxe+Y3u3KdlTofrKO8o9jHN+MVpJ8
         MSFtFDKEgV5AZeOjLyY3leCwbn0P9kLHOrjpA0XijSB3Xz04KAle6dZVnEmn+eta6NyH
         GiT+nbYQAFtOEGwkbgVK4gQNfFE11FNPSJbJkn/6XgiYxOu5G5BUnsAonQ0wRIw7b7CZ
         /QG3j9kjN9cisxh4G32LlDgtQFEffYAQjh1iyGJMBy4V0JVMixCFSc+UzSH612xTrdRj
         Nrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430089; x=1697034889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyQJmck1/pI5OX/IX07IDtTyF+FKPIka6gVUOADEZr8=;
        b=WpVxY2sDp2vSJSRmeFdNrj+5friNb/skCjTauUJIXhGJYyEIf6lOZzZBh6apBn5Y5F
         yDi4A6OleY+mtosPbOQL29/GuWVEUk9fpjGAgCtD4pB8q+VVW+gB0/y72YWqjQk5RjA9
         FvsnIRoD6wO+MTUoFMccJLOLL7ee3oQUhIu4xFxJqRbssnNfJIRDCLa+CbTsVFzIsjmb
         09bjujzYOXmNbTE1XAe6gu25dz1GKsxxyn1XAKCKm4dwpddck4IPCCctN3q5S/3FxDqj
         XqGh2nMihyrQ+eM7kXukkfnzqwQhaLOBKGx7dY5VRJOt14xkL+cx2B6a8Z0eS37tLn78
         ErBg==
X-Gm-Message-State: AOJu0YzXYJnwbuYBZPj/8zberrcnMLVjqyVZ80kW3FjSIhb6hI6g0Q4w
	OraY9VrZwNBJOlw2tvd7pp+ZlQ==
X-Google-Smtp-Source: AGHT+IGzp/S6AMTHi02JDakLFsQHybTWZ0pEAN4ECemzds5xOO34p1aXoKuAUJwbGsZ5rcqs2qdXOQ==
X-Received: by 2002:adf:ecc3:0:b0:31f:edc3:c5fb with SMTP id s3-20020adfecc3000000b0031fedc3c5fbmr2087729wro.5.1696430089475;
        Wed, 04 Oct 2023 07:34:49 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b00401e32b25adsm1686205wmi.4.2023.10.04.07.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:34:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH 5/5] riscv: kvm: use ".L" local labels in assembly when applicable
Date: Wed,  4 Oct 2023 16:30:54 +0200
Message-ID: <20231004143054.482091-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004143054.482091-1-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_073450_757570_89D6A419 
X-CRM114-Status: GOOD (  10.10  )
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

Rm9yIHRoZSBzYWtlIG9mIGNvaGVyZW5jeSwgdXNlIGxvY2FsIGxhYmVscyBpbiBhc3NlbWJseSB3
aGVuCmFwcGxpY2FibGUuIFRoaXMgYWxzbyBhdm9pZCBrcHJvYmVzIGJlaW5nIGNvbmZ1c2VkIHdo
ZW4gYXBwbHlpbmcgYQprcHJvYmUgc2luY2UgdGhlIHNpemUgb2YgZnVuY3Rpb24gaXMgY29tcHV0
ZWQgYnkgY2hlY2tpbmcgd2hlcmUgdGhlCm5leHQgdmlzaWJsZSBzeW1ib2wgaXMgbG9jYXRlZC4g
VGhpcyBtaWdodCBlbmQgdXAgaW4gY29tcHV0aW5nIHNvbWUKZnVuY3Rpb24gc2l6ZSB0byBiZSB3
YXkgc2hvcnRlciB0aGFuIGV4cGVjdGVkIGFuZCB0aHVzIGZhaWxpbmcgdG8gYXBwbHkKa3Byb2Jl
cyB0byB0aGUgc3BlY2lmaWVkIG9mZnNldC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5T
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3N3aXRjaC5TCmluZGV4IDhiMTg0NzM3ODBhYy4uMGMyNjE4OWFhMDFjIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TCisrKyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfc3dpdGNoLlMKQEAgLTQ1LDcgKzQ1LDcgQEAgU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlz
Y3Zfc3dpdGNoX3RvKQogCVJFR19MCXQwLCAoS1ZNX0FSQ0hfR1VFU1RfU1NUQVRVUykoYTApCiAJ
UkVHX0wJdDEsIChLVk1fQVJDSF9HVUVTVF9IU1RBVFVTKShhMCkKIAlSRUdfTAl0MiwgKEtWTV9B
UkNIX0dVRVNUX1NDT1VOVEVSRU4pKGEwKQotCWxhCXQ0LCBfX2t2bV9zd2l0Y2hfcmV0dXJuCisJ
bGEJdDQsIC5Ma3ZtX3N3aXRjaF9yZXR1cm4KIAlSRUdfTAl0NSwgKEtWTV9BUkNIX0dVRVNUX1NF
UEMpKGEwKQogCiAJLyogU2F2ZSBIb3N0IGFuZCBSZXN0b3JlIEd1ZXN0IFNTVEFUVVMgKi8KQEAg
LTExMyw3ICsxMTMsNyBAQCBTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNjdl9zd2l0Y2hfdG8pCiAK
IAkvKiBCYWNrIHRvIEhvc3QgKi8KIAkuYWxpZ24gMgotX19rdm1fc3dpdGNoX3JldHVybjoKKy5M
a3ZtX3N3aXRjaF9yZXR1cm46CiAJLyogU3dhcCBHdWVzdCBBMCB3aXRoIFNTQ1JBVENIICovCiAJ
Y3NycncJYTAsIENTUl9TU0NSQVRDSCwgYTAKIAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
