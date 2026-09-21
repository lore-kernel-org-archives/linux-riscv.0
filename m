Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5854C982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZZSSq7bcefU6h57Rh1vg40F+YXVVmWJE0uybO/khEs=; b=wB3YiRbZdCsXo3
	9qdINDLGRYExmv2JA3cOs4mGp2iYHDxt980qZ49bUTycoW75kzo8gW7VYJgqvythgAsNYDuZnHrKI
	scl0+g0w7xPQLZZog95yzquiKkPFe+8WmRsD8UHKQfUoXebeMtCXo8UKG4ccaJfEqz0dJTQNeqaKB
	hRNIYGDbL38bm9GZt4HoX+A1f+Hv5ips5CSOpH+R75mQ6JFlZGA8MxtoVJ3e5bI0VQSFQXQ2cGD+G
	m4I0GjmzF+d/XJJTSGN/U/9aAiYzePiJm+TwHnSNw+AqhpY0UMh/klNfwlZJ2zyuiVQdaDgBtZpey
	BkJ8gZSoyoc49f7Hlyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4e-000000031nc-3LZH;
	Mon, 21 Sep 2026 17:45:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4a-000000031gV-34h5
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Reply-To:Sender:Content-ID:Content-Description;
	bh=P1dhUTiarEg5c5I3QHkxBctKjtcsAKr4VX6TAcrbU/Q=; b=dIBSvKqrXIjSQ4kc5KgR5MqhVc
	pKqiidHb0DZCwTrcLqkfBRlnkwW2TaqbKD4ugFRo45xe8O5EqkPCFn7zY/88ut+fdOw9D9OL8rkqx
	Yhk+5Tr6+A/fZd04QAAa9GAWK0gv9WhnTfANrkVmQjr5/gs6tHWQ+LYIEKyXeUvgDxTlwNQa2jM5G
	iY2V7Q3d55xBsXh1vTinR6UG0X1q337Au7JrLy5zY333qEocDbYWttqRZWfzHdWNoV7NliypOo5up
	6PLHDgZKl3ltCV/26SPnatvGRDSXf+B0VgbyQPhTqxlY0s62WWtwMWki72N5fINWcuw2BIX34qGw4
	riZfNKKA==;
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4X-0000000Cdri-1esv
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:59 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d9336581a2so56417515ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012695; x=1790617495; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:reply-to:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1dhUTiarEg5c5I3QHkxBctKjtcsAKr4VX6TAcrbU/Q=;
        b=PjnF3pRIVVzsGoOhL+5RQQBZLTHWnCE45U4hVmR6whlY92A2MJbUBasg5UPUY/wiIw
         OSbRGA+YaKXTsreBvA+lohQfoAqnfxX0KRNfOBMyTiClY8NoEtOTE5iVVSVip3ebW3d9
         wYxxxv54wizkYjvFuKc/WvI8z21qwaleqDQiV8KSjuWvAFPTIl/U8MPmptucWZ8EVoXA
         ehTGlkssfwegxQRxJ5lpZj65rlLnn47ZW6ife/nzv4QgbkfJdUsM/KqGuUJCdmSEr1YF
         klvMcwvWENgWu1zHdl+ILR6V2j8u8fwTiresckim4WQHURiIjHW7FmAiuIS90ttAxnTx
         vpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012695; x=1790617495;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1dhUTiarEg5c5I3QHkxBctKjtcsAKr4VX6TAcrbU/Q=;
        b=lRjUw85AjPLEFQ4kCfch+ACD0agFtWJML0KimZvEV+CfJa7xFyZ+YdcoX0aLMQ2b1U
         L1ZSMnpn6jreHUvuTPYR7Toh3DQYv5oMxX/pB75t2Ib08zHUocro7hay31W1J4DcVY5D
         xuVCNzE1yI0GsJ4dwF2FtxwGd/6G5xq13kVOY65aapaUDqxLBYw4viuH1yHWnur2tLwI
         GcGnx+JWDzntvvrkJiNpzOPtPJBPvS8Xev2FgzQ5ffbLG47o4NbujV7VAIcXKUjHzZwK
         W2DFobMB1evam7qgrpTcVcF4sS++JZ5SohsE5jnwjKSXALpfSx43xwBihoXxtl59E37M
         327g==
X-Forwarded-Encrypted: i=1; AKwUvBz69ti7alBnCmg7K6Olm8iaW2fVBABZuUcg419nR7gAAxVQD4FvPckoKJQ3l7MOV4dANtPNNMbuZsGlGQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nRxGfDd2b0hmfVxCZtxPLChtQdllvYuPNkhblqBVaz0OYNA9/k
	6wtN6W9+ANI2sYMlP/71tYiDeQDiu7qemDAVREn/LOcMI5GtLNwqYs7/Z+lHiFYyynmXDxsq3mK
	pgnUnYg==
X-Received: from plao21.prod.google.com ([2002:a17:903:3015:b0:2dc:5417:2772])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d984:b0:2df:3b09:664
 with SMTP id d9443c01a7336-2df3b0909cbmr71040325ad.32.1790012694298; Mon, 21
 Sep 2026 10:44:54 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:44 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-7-seanjc@google.com>
Subject: [PATCH v2 6/7] Revert "KVM: Check for duplicate vcpu_id as early as possible"
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_184457_743668_3BDEFDA6 
X-CRM114-Status: GOOD (  11.26  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Tm93IHRoYXQgS1ZNIHVzZXMga3ZtX2dldF92Y3B1X2J5X2lkKCkgdG8gY2hlY2sgZm9yIGFuIGV4
aXN0aW5nIHZDUFUgSUQKYmVmb3JlIGRvaW5nIGFueSBtZWFuaW5nZnVsIHdvcmssIHdoaWNoIHdh
cyBtYWRlIHBvc3NpYmxlIGJ5IGhvbGRpbmcKa3ZtLT5sb2NrIGZvciB0aGUgZW50aXJldHkgb2Yg
dkNQVSBjcmVhdGlvbiwgcmV2ZXJ0IHRoZSBub3ctcmVkdW5kYW50CiJlYXJseSIgdkNQVSBJRCB0
cmFja2luZy4gIFRoZSBjbGFpbXMgYWJvdXQgdGhlIGltcGFjdCBvZiBrdm0tPnZjcHVfaWRzIG9u
CnRoZSBtZW1vcnkgZm9vdHByaW50IHdlcmUgYSB3ZWUgYml0IHdyb25nOiB0aGUgd29yc3QgY2Fz
ZSBzY2VuYXJpbyBpc24ndAoyNTYgYnl0ZXMgcGVyIFZNLCBpdCdzIDI1NiAidW5zaWduZWQgbG9u
Z3MiIHBlciBWTSwgaS5lLiAyMDQ4IGJ5dGVzIHBlciBWTS4KCkluY3JlYXNpbmcgdGhlIHNpemUg
b2YgInN0cnVjdCBrdm0iIGJ5IDIwNDggbmVhcmx5IGRvdWJsZWQgdGhlIHRvdGFsIHNpemUKb24g
bWFueSBhcmNoaXRlY3R1cmVzLCBhbmQgdHJpcHBlZCB4ODYncyBLVk1fU0FOSVRZX0NIRUNLX1ZN
X1NUUlVDVF9TSVpFLAp3aGljaCB3YXMgYWRkZWQgdG8gZGV0ZWN0IHRoaXMgKmV4YWN0KiBzY2Vu
YXJpbywgd2hlcmUgYSBzaW5nbGUgY2hhbmdlCnNpZ25pZmljYW50bHkgaW5jcmVhc2VkIHRoZSBz
aXplIG9mICJzdHJ1Y3Qga3ZtIi4gIEkuZS4gYXR0ZW1wdGluZyB0byBidWlsZApLVk0gd2l0aCBD
T05GSUdfREVCVUdfS0VSTkVMPW4gZmFpbHMgb24geDg2ICh0aGUgYnVpbGQgZmFpbHVyZXMgZ290
IG1pc3NlZApiZWNhdXNlIGFsbCBidWlsZCBib3RzIGFwcGFyZW50bHkgdGVzdCBvbmx5IENPTkZJ
R19ERUJVR19LRVJORUw9eSBrZXJuZWxzLAphbmQgbWFpbnRhaW5lcnMnIHRlc3QgZmxvd3Mgd2Vy
ZSBzaW1pbGFybHkgbGFja2luZykuCgpUaGlzIHJldmVydHMgY29tbWl0IDk3ZDY1YjU0NGY0OGIy
ZWU0OWY2YWVhMzIxNDVlM2U3OTY5OTU1ZGMuCgpGaXhlczogOTdkNjViNTQ0ZjQ4ICgiS1ZNOiBD
aGVjayBmb3IgZHVwbGljYXRlIHZjcHVfaWQgYXMgZWFybHkgYXMgcG9zc2libGUiKQpSZXBvcnRl
ZC1ieTogSmVhbi1DaHJpc3RvcGhlIEd1aWxsYWluIDxqZWFuLWNocmlzdG9waGVAZ3VpbGxhaW4u
bmV0PgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC81NmE0YmMzNWVlNjA1NTg4
YjdjYzM2YzhlNDVjMTJiNWYzYjUwNmNiLmNhbWVsQGd1aWxsYWluLm5ldApSZXBvcnRlZC1ieTog
UGF3ZcWCIFMgPHNwYXdlbDUyM0BnbWFpbC5jb20+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL0NBQkQlM0RXRk9TNGo0aER2JTJCcFctZUVNOUhBTTJxMkdZX2lZZEFHJTJCcXZZ
Y1VFaW5VcmNRUUBtYWlsLmdtYWlsLmNvbQpUZXN0ZWQtYnk6IEplYW4tQ2hyaXN0b3BoZSBHdWls
bGFpbiA8amVhbi1jaHJpc3RvcGhlQGd1aWxsYWluLm5ldD4KU2lnbmVkLW9mZi1ieTogU2VhbiBD
aHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oIHwgMSAtCiB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgfCA1IC0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDAzYmZjOTI4NjRiNi4uNmFh
YjE2N2JmNDgyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIvaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC03OTEsNyArNzkxLDYgQEAgc3RydWN0IGt2bSB7CiAJ
LyogVGhlIGN1cnJlbnQgYWN0aXZlIG1lbXNsb3Qgc2V0IGZvciBlYWNoIGFkZHJlc3Mgc3BhY2Ug
Ki8KIAlzdHJ1Y3Qga3ZtX21lbXNsb3RzIF9fcmN1ICptZW1zbG90c1tLVk1fTUFYX05SX0FERFJF
U1NfU1BBQ0VTXTsKIAlzdHJ1Y3QgeGFycmF5IHZjcHVfYXJyYXk7Ci0JREVDTEFSRV9CSVRNQVAo
dmNwdV9pZHMsIEtWTV9NQVhfVkNQVV9JRFMpOwogCS8qCiAJICogUHJvdGVjdGVkIGJ5IHNsb3Rz
X2xvY2ssIGJ1dCBjYW4gYmUgcmVhZCBvdXRzaWRlIGlmIGFuCiAJICogaW5jb3JyZWN0IGFuc3dl
ciBpcyBhY2NlcHRhYmxlLgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQv
a3ZtL2t2bV9tYWluLmMKaW5kZXggZDU1MjRhYzhjNWNmLi45ODVhZjM5Yjk4MGEgMTAwNjQ0Ci0t
LSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtNDE4
NSwxNSArNDE4NSwxMSBAQCBzdGF0aWMgaW50IGt2bV92bV9pb2N0bF9jcmVhdGVfdmNwdShzdHJ1
Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgaWQpCiAJaWYgKGt2bV9nZXRfdmNwdV9ieV9pZChr
dm0sIGlkKSkKIAkJcmV0dXJuIC1FRVhJU1Q7CiAKLQlpZiAoV0FSTl9PTl9PTkNFKHRlc3RfYml0
KGlkLCBrdm0tPnZjcHVfaWRzKSkpCi0JCXJldHVybiAtRUVYSVNUOwotCiAJciA9IGt2bV9hcmNo
X3ZjcHVfcHJlY3JlYXRlKGt2bSwgaWQpOwogCWlmIChyKQogCQlyZXR1cm4gcjsKIAogCWt2bS0+
Y3JlYXRlZF92Y3B1cysrOwotCV9fc2V0X2JpdChpZCwga3ZtLT52Y3B1X2lkcyk7CiAKIAl2Y3B1
ID0ga21lbV9jYWNoZV96YWxsb2Moa3ZtX3ZjcHVfY2FjaGUsIEdGUF9LRVJORUxfQUNDT1VOVCk7
CiAJaWYgKCF2Y3B1KSB7CkBAIC00Mjc2LDcgKzQyNzIsNiBAQCBzdGF0aWMgaW50IGt2bV92bV9p
b2N0bF9jcmVhdGVfdmNwdShzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgaWQpCiAJa21l
bV9jYWNoZV9mcmVlKGt2bV92Y3B1X2NhY2hlLCB2Y3B1KTsKIHZjcHVfZGVjcmVtZW50OgogCWt2
bS0+Y3JlYXRlZF92Y3B1cy0tOwotCV9fY2xlYXJfYml0KGlkLCBrdm0tPnZjcHVfaWRzKTsKIAly
ZXR1cm4gcjsKIH0KIAotLSAKMi41NS4wLjEwODIuZzJiOTIyNmJiYzAtZ29vZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
