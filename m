Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8FDCCD1AB
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 00:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a4ESmTU3EGTqbcl3zcQ6iDeU1tTmBwUzPT1bSUO6/sQ=; b=kEZlNRRopHkpyCYrnQ+0NlDg06
	OLoczEnEhLVVD22v+oWhCTgNdo5Z9NNQO6zBxhnlbNPV6MjzOMlAtIyAbA5ps4HpbWEimHpV3wxUt
	mnWihoAO9lzBZhn4IkATNYt/mavA5HELKZ9WD0FcjAatzcPWpfg2YYXHGm6lHaoGVkqztK317q++b
	bwXSDbr4OlW50voKPCPEBdFhBnMe+Ii1ZGm3tgHXekKWDa+SH+eQetDqPzaWwVH+HQjTG2wtg2Tmj
	1quyujzG+HLBtNzCzPWwCX32wwIWum2Y00MKl4YGFOIKoNGMDHEEfqEXj+NZbmrCzzF/542bweYRO
	39YcTOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipx-00000004d3h-1JgY;
	Thu, 23 Oct 2025 00:05:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBipv-00000004d2W-2UMr
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 00:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=; b=j/5zBLue1pJHdvOSiXcjwDclE1
	O4gP+tIdtUpuwuxj0ulot7SMGje33U36meOHvM/NOzj6Rm9SnM5DaXyaZy86qv2O0y+uFk2h14t4l
	xBVoDhbDwY2i/IEMyyD1VIEy5p5GJUFqqPiqJdS/t0fBaQ33JRJ1a4csP/27FXuYy+/MWxCrv7SRf
	QbGLXLDQICKgNytUDWxqjzZjdcfAL0Z6Ou0BVVp+dIWbOZApuW55vA+9w22fr82ckRUA+ezT7uHF6
	SmXfrYJCd3ZKbStKV2fb/S3d8oRGpHkxM62m7IotcEn5WJbGLcuMSgT0NthbTqLiOcwQGKcZx7tci
	0+O/152A==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBhyB-00000000vke-1szn
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 23:10:18 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33be4db19cfso423123a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761177941; x=1761782741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=;
        b=B08GLFdpUb36vLNEWdJ+7T9UxKWH1XSRXgmRKpl2ZIIT6wg/rt17WmrFkSsePlUIzK
         YalxCr9G6e6hP9SuoJwViLsMcpR4aIPBayZffmMejCBLZtkDxRDHQn+YTAOCKqz57QqL
         gZ90da9RHoGyR7Ecf2pHQZUoVIpLq/8frpjNX0mLPq2o1l6ysPDQZV1kaJyPVRiOgxfs
         7H+zx2RvwTlVl5MH2asGMaa33By0Yrxvv2fFoANtU7zMF2rn+g5fk0lUcbyRDcMzGgIA
         IDV9eemyo062TR8/T3i3HhJw8t9uzcv50tDLeU+N+yGGEZFTMQ2ylSejAcJXzww0ZkhV
         LHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177941; x=1761782741;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lzZENSWUwrBhAA1CxL4i/AxbZEWI19mQXc700MJvOfI=;
        b=EFYOC6sOjmGzggJyALgZ5umFq1F54fJ7Wh6FugnqyiZKP5IAOSiNrnoeQxvAImO5Wt
         NORZnMp01XGdEJXR6AeQJf8UmkVBFJ8QTuJYHoPCZJWeBWi4KeQPq2xTzo5QM5XUYgEH
         NCVp5NHOVQ0xgQu3ONh2RPJOQjZ3T0vLrg9dSmxjzYw+EmHnq+rTCHnsVaQ2Rip1/kXG
         jPm9HIW3fnjR2z2FziTbIdra5Xn64Wxki+gGW13A0H3XnbKECELfEvXXWBPcERpSMPZt
         CF/+3Qr/i2DY44Hz9RWU0lXsoQI+WeWmyV9K27iH4Veescj6fkep/fMWC0XM5nkDKmU6
         5EbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbwzhFFrFEjX5K0h5d8wn7mrJP9AkFlrISz9ySDILpfE+aE4F3aMkuGwc+E7vYuJoWR8bR0w3kguRR1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+7sjv3EpTVoeAt5S+e2K56Li+cstyIB3PkJRYKaLTpVNLFHod
	WuGohK9MwW1cPs51bZS1A0FA00JVPDRondyhT7ied2MIiwQgyu4dd3dEoXPJRZP/258n3PYCY+3
	b3rsWUA==
X-Google-Smtp-Source: AGHT+IGd6U9IlxxZkQUE9in6Tsw30xR2bnzy7O0+0w49jme5smP7pCaW5imecIRz7OgZNwNV7y77C8X4JZs=
X-Received: from pjbco18.prod.google.com ([2002:a17:90a:fe92:b0:33b:51fe:1a83])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c05:b0:339:ec9c:b275
 with SMTP id 98e67ed59e1d1-33bcf84e181mr33310671a91.6.1761177941265; Wed, 22
 Oct 2025 17:05:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 00:04:44 +0000
In-Reply-To: <20251023000535.2897002-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com>
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
Message-ID: <20251023000535.2897002-3-kuniyu@google.com>
Subject: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_001015_581413_58EEA178 
X-CRM114-Status: GOOD (  11.31  )
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

ZXBvbGxfcHV0X3VldmVudCgpIGNhbGxzIF9fcHV0X3VzZXIoKSB0d2ljZSwgd2hpY2ggYXJlIGlu
bGluZWQKdG8gdHdvIGNhbGxzIG9mIG91dC1vZi1saW5lIGZ1bmN0aW9ucywgX19wdXRfdXNlcl9u
b2NoZWNrXzQoKQphbmQgX19wdXRfdXNlcl9ub2NoZWNrXzgoKS4KCkJvdGggZnVuY3Rpb25zIHdy
YXAgbW92IHdpdGggYSBzdGFjL2NsYWMgcGFpciwgd2hpY2ggaXMgZXhwZW5zaXZlCm9uIGFuIEFN
RCBFUFlDIDdCMTIgNjQtQ29yZSBQcm9jZXNzb3IgcGxhdGZvcm0uCgogIF9fcHV0X3VzZXJfbm9j
aGVja180ICAvcHJvYy9rY29yZSBbUGVyY2VudDogbG9jYWwgcGVyaW9kXQogIFBlcmNlbnQg4pSC
CiAgICA4OS45MSDilIIgICAgICBzdGFjCiAgICAgMC4xOSDilIIgICAgICBtb3YgICVlYXgsKCVy
Y3gpCiAgICAgMC4xNSDilIIgICAgICB4b3IgICVlY3gsJWVjeAogICAgIDkuNjkg4pSCICAgICAg
Y2xhYwogICAgIDAuMDYg4pSCICAgIOKGkCByZXRxCgpUaGlzIHdhcyByZW1hcmthYmxlIHdoaWxl
IHRlc3RpbmcgbmVwZXIvdGNwX3JyIHdpdGggMTAwMCBmbG93cyBwZXIKdGhyZWFkLgoKICBPdmVy
aGVhZCAgU2hhcmVkIE8gIFN5bWJvbAogICAgMTAuMDglICBba2VybmVsXSAgW2tdIF9jb3B5X3Rv
X2l0ZXIKICAgICA3LjEyJSAgW2tlcm5lbF0gIFtrXSBpcDZfb3V0cHV0CiAgICAgNi40MCUgIFtr
ZXJuZWxdICBba10gc29ja19wb2xsCiAgICAgNS43MSUgIFtrZXJuZWxdICBba10gbW92ZV9hZGRy
X3RvX3VzZXIKICAgICA0LjM5JSAgW2tlcm5lbF0gIFtrXSBfX3B1dF91c2VyX25vY2hlY2tfNAog
ICAgIC4uLgogICAgIDEuMDYlICBba2VybmVsXSAgW2tdIGVwX3RyeV9zZW5kX2V2ZW50cwogICAg
IC4uLiAgICAgICAgICAgICAgICAgIF4tIGVwb2xsX3B1dF91ZXZlbnQoKSB3YXMgaW5saW5lZAog
ICAgIDAuNzglICBba2VybmVsXSAgW2tdIF9fcHV0X3VzZXJfbm9jaGVja184CgpVc2UgX191c2Vy
X3dyaXRlX2FjY2Vzc19iZWdpbigpIGFuZCB1bnNhZmVfcHV0X3VzZXIoKSBpbgplcG9sbF9wdXRf
dWV2ZW50KCkuCgpXZSBzZWUgMSUgaW1wcm92ZW1lbnQgb24gdGNwX3JyIHRocm91Z2hwdXQgYnkg
anVzdCBzYXZpbmcgYSBzaW5nbGUKc3RhYy9jbGFjIHBhaXIuCgpBbm90aGVyIG9wdGlvbiB3b3Vs
ZCBiZSB0byB1c2UgY2FuX2RvX21hc2tlZF91c2VyX2FjY2VzcygpCmFuZCBtYXNrZWRfdXNlcl9h
Y2Nlc3NfYmVnaW4oKSwgYnV0IHdlIHNhdyB+NSUgcmVncmVzc2lvbiB3aXRoCnVubmVjZXNzYXJ5
IDMgb3BlcmF0aW9ucyBmb3IgYWRkcmVzcyBtYXNraW5nLCB3aGljaCBpcyBhbHJlYWR5CmNoZWNr
ZWQgYnkgZXBfY2hlY2tfcGFyYW1zKCkuCgpTdWdnZXN0ZWQtYnk6IEVyaWMgRHVtYXpldCA8ZWR1
bWF6ZXRAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogS3VuaXl1a2kgSXdhc2hpbWEgPGt1bml5
dUBnb29nbGUuY29tPgotLS0KIGluY2x1ZGUvbGludXgvZXZlbnRwb2xsLmggfCAxMyArKysrKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZXZlbnRwb2xsLmggYi9pbmNsdWRlL2xpbnV4L2V2
ZW50cG9sbC5oCmluZGV4IGNjYjQ3OGViMTc0Yi4uZWZjMGFhMmQ0OTZmIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2V2ZW50cG9sbC5oCisrKyBiL2luY2x1ZGUvbGludXgvZXZlbnRwb2xsLmgK
QEAgLTgyLDExICs4MiwxNCBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBlcG9sbF9ldmVudCBfX3Vz
ZXIgKgogZXBvbGxfcHV0X3VldmVudChfX3BvbGxfdCByZXZlbnRzLCBfX3U2NCBkYXRhLAogCQkg
c3RydWN0IGVwb2xsX2V2ZW50IF9fdXNlciAqdWV2ZW50KQogewotCWlmIChfX3B1dF91c2VyKHJl
dmVudHMsICZ1ZXZlbnQtPmV2ZW50cykgfHwKLQkgICAgX19wdXRfdXNlcihkYXRhLCAmdWV2ZW50
LT5kYXRhKSkKLQkJcmV0dXJuIE5VTEw7Ci0KLQlyZXR1cm4gdWV2ZW50KzE7CisJX191c2VyX3dy
aXRlX2FjY2Vzc19iZWdpbih1ZXZlbnQsIHNpemVvZigqdWV2ZW50KSk7CisJdW5zYWZlX3B1dF91
c2VyKHJldmVudHMsICZ1ZXZlbnQtPmV2ZW50cywgZWZhdWx0KTsKKwl1bnNhZmVfcHV0X3VzZXIo
ZGF0YSwgJnVldmVudC0+ZGF0YSwgZWZhdWx0KTsKKwl1c2VyX2FjY2Vzc19lbmQoKTsKKwlyZXR1
cm4gdWV2ZW50ICsgMTsKK2VmYXVsdDoKKwl1c2VyX2FjY2Vzc19lbmQoKTsKKwlyZXR1cm4gTlVM
TDsKIH0KICNlbmRpZgogCi0tIAoyLjUxLjEuODE0LmdiOGZhMjQ0NThmLWdvb2cKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
