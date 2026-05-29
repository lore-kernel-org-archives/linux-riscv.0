Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71398CD5BD2
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 06:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cBEvZ3Angzdd3EF9B7UCk0dy1PXfsWhCPo4iwf00eRw=; b=LIiG+dsnbk+2Fp
	5YF7qcHo6BxgZ7Sua7bbvhCvEjDKc3uDXerw/2AkCtPNY8bIokyxdxjk/0nQnuxi4uOZA5flxp6HF
	+A2ovoV9z2fuwjMjW+pSlamyIVD42eLB4sjats++2vdYB3/xbytxu5QAyLfswocuCosoN1f6KLuCf
	HoWfytRM/rjdxDJxSq126YEi/S+mw3hL9F/NJPI6Zr03SHf0z2eFsEpVD1rdXOmzSAVLg536WCJYa
	IamAHGH0sgwBU0Tf1oq7+FMlotlC4JiX/rLulCEic5aENm1rRhStKUhb64yY30xu/ap10s4+We3gH
	ii54mP+C7k1eyjCtwwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqi7-00000006oB4-0L35;
	Fri, 29 May 2026 06:28:47 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqi4-00000006o96-1IDF
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 06:28:46 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-304f0039c02so137602eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 23:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780036123; x=1780640923; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yc3+Um0q/cLzforp36o+SIYNj+jJ+pe+LLCc2WA5hpM=;
        b=Y2qe0jX8PqrI5KuAb5EUMuVmWbR1E84851ET1vGFXdEe7KdSXB9lUzjTDhp6gwwXFC
         v1H5KfyXTD2KcSxKX0MznV5SanZB/MhSj/PdQ/Ipsyz7bMvfN8/LWPpTp+R9NXnqjiuP
         lL/6C9ztmtGUVxB9AzMmDuMDOKW62Dd55Bv9qQBG+2qspNA6sIcTHFymLMAF3pDjt06p
         SlykCKr8thJA8rN6zeqRlIhFGnCzeThoK6ABJM8pVFkv9i9t70n4AB77rwqthqioEnVi
         fuNXjXgjOs6HR3dARYCDpgpPysSuJpqYx4hIXwpIdq74Z3X8hMUQEBNfmx9FPkR5rLQV
         YLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036123; x=1780640923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc3+Um0q/cLzforp36o+SIYNj+jJ+pe+LLCc2WA5hpM=;
        b=StCDcUjdXrwI6NNYf6mDOMKNY76zAqCEC+Zd4Frpz0QFte5/EZuD7Lcks/PajRY4KU
         njX7Z00WcVYakl5SJIgoxsNQBy4D5Gspo/IZ961FWO2LvXH00U+5dW/Cp6RWSOT2AEmT
         zjIo1/Ht2sYz+uTqI+sp7GozhhZx1nwHl0pzx9+bZrWtOiXRYW+xejLjv4ltOdttB4Eo
         emYJ9Vbi14RVnMK8c3HJFeGriu5jV8PcUgjKy5S5typvSF+l1rKWXvoF6HADhvZBWVhK
         Zupc+KnraPkFpE2mtvXyDw/fevNZZNgV/SQsntz9wNjuOoB31Hsye9XM58728trPhRZb
         LiAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WXyP2GMZBrqXmNSIlt/FdW41IGt2EED8SShwASGcMT9ZW+c/HhaqJZrQ6UMS8ofzWW9kfDWwkiFelvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzySiNzS+mUhJpNf768NNYdL7GmdAgBBQf4lprRthOFvR3Mm7AU
	Y8jVCFRTuj9F1FSzpq2YTsUW3YLpRyfPp+ZgpLrORPfN1C+R0kLXB//zPih/GblQkF0=
X-Gm-Gg: Acq92OHjxRrn3rTmj3BDdKiTp6mPUnb1DofQLYjJjClq0tPwYub03i0mu/mwjOuhIKY
	0RwdF3xkvFlmaBau4xaWUV4o5IySoRGx/07tWwF9ClFww3tsDQk7xYNfac93xFFdZ9fjwsMzE+g
	vNeidstyUjBui8nd+AkFrlHXDIAYf/zKxnPxrhwVqQBbBVMD6m1/hbdX4spF4jTYNU8ZvM3u0d5
	cZhgg9jt158eKNSRyUAKqJCIzoBKFBna8xUZ067ySQe9pD7TmqxlHzN4SeEF3zJKcNaZ6xXOmEi
	hsNyU/+mkySYliS0HNHWVr+d7222Jhep6YSXDfAA+FdpRqQS2cKhuvkkmPC2lsntyO6O6sCr1UM
	8FKbUx3WVVeA4ymkCb4NxuU3clfG+ACSeSijcaAc6C4yv3bA6cG0g3LiWKC7sXs3u3orcP9zqLF
	CtoX1N8f9qn/cdHbEqbSAWY+eEta1OVJypFQQdlkGdhH+L9V9ec90AYQ==
X-Received: by 2002:a05:7301:3f16:b0:304:8366:7456 with SMTP id 5a478bee46e88-304eb0f0b91mr881488eec.3.1780036123025;
        Thu, 28 May 2026 23:28:43 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed3358b1sm694607eec.13.2026.05.28.23.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:28:42 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v3 0/3] KVM: riscv: add check_supported_reg() into
 get-reg-list test
Date: Thu, 28 May 2026 23:28:26 -0700
Message-Id: <20260528-kvm-get_reg_list-v2-v3-0-170969a8599f@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAoyGWoC/32NQQ6CMBREr0L+2ppSSg2uvIchpNbf8lXAtNhoS
 O9uwb3JbF4yb2aBgJ4wwLFYwGOkQNOYodoVYHo9OmR0zQyCC8Vrodg9Dszh3Hl03YPCzKJgtrG
 ValSpjTKQzadHS+9t9dz+OLwuNzTzOrU2+mxO/rPdRrH2/j/kcHZoJNeSl7KW+hTIUsS9mQZoU
 0pfK5R+F8kAAAA=
X-Change-ID: 20260526-kvm-get_reg_list-v2-f9f36961ac6c
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780036122; l=2682;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=VBg6eYh18X5PDnPO9DIhzM31fE7SG2D5HIs6cG6KOkA=;
 b=WZoiBediPqeVKPQUkdFvp7yI3jn8I3iTjYJoIKq4mGWSe2Kp/W2UGojEd5uTJ0uuEmyPqLRcj
 7rI61rm9xdwBJrDzyxmPQWX4j2oJx3ZKHkGz5kt7Z7XalBAlPFk0bj0
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_232844_376476_0FF73460 
X-CRM114-Status: UNSURE (   7.68  )
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

VGhpcyBzZXJpZXMgYWRkcmVzc2VzIGEgYnVnIGluIHRoZSBTQkkgRldGVCAoRmlybXdhcmUgRmVh
dHVyZXMpIGV4dGVuc2lvbgp3aGVyZSBmZWF0dXJlcyBjb3VsZCByZW1haW4gZXhwb3NlZCB0byBn
dWVzdHMgYWZ0ZXIgdGhlaXIgZGVwZW5kZW50IElTQQpleHRlbnNpb25zIGFyZSBkaXNhYmxlZCBh
dCBydW50aW1lLCBhbmQgaW1wcm92ZXMgdGhlIHJlbGF0ZWQgc2VsZnRlc3QKaW5mcmFzdHJ1Y3R1
cmUuCgpUaGUgYnVnIChwYXRjaCAxKSBvY2N1cnJlZCBiZWNhdXNlIEZXRlQgZmVhdHVyZSBzdXBw
b3J0IHdhcyBjYWNoZWQgYXQgdkNQVQppbml0aWFsaXphdGlvbiB0aW1lLiBXaGVuIHVzZXJzcGFj
ZSBzdWJzZXF1ZW50bHkgZGlzYWJsZWQgSVNBIGV4dGVuc2lvbnMKdmlhIEtWTSBPTkVfUkVHLCB0
aGUgY2FjaGVkIHN1cHBvcnQgc3RhdHVzIHdhcyBub3QgdXBkYXRlZCwgbGVhZGluZyB0bwpzdGFs
ZSBmZWF0dXJlIGV4cG9zdXJlLgoKVGhlIHNlbGZ0ZXN0IGltcHJvdmVtZW50cyAocGF0Y2hlcyAy
LTMpIGVuaGFuY2UgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGJ5CnJlZmFjdG9yaW5nIHRoZSBleHRl
bnNpb24gc3VibGlzdCBpbmZyYXN0cnVjdHVyZSBhbmQgc3BsaXR0aW5nIEZXRlQKZmVhdHVyZSB0
ZXN0aW5nIGludG8gc2VwYXJhdGUsIHByb3Blcmx5LWdhdGVkIHN1Ymxpc3RzLgoKLS0tCkNoYW5n
ZXMgaW4gdjM6Ci0gUmVzdG9yZSAnc3VwcG9ydGVkJyBmaWVsZCB3aXRoIGluaXQoKSBjYWxsYmFj
ayBmb3IgaW5pdGlhbGl6YXRpb24gcHJvYmluZwogIChzYXNoaWtvLWJvdCkKLSBBZGQgTlVMTCBj
aGVja3MgYmVmb3JlIGNhbGxpbmcgZmVhdHVyZS0+c3VwcG9ydGVkKCkgaW4gYWxsIGZ1bmN0aW9u
cwotIEZpeCBpc2FfZXh0X2VuYWJsZWQgdHJhY2tpbmcgbG9naWMgYW5kIHJlc3RvcmUgaXNhX2V4
dF9jYW50X2Rpc2FibGUgYXJyYXkKLSBBZGQgc2JpX2V4dF9lbmFibGVkIHRyYWNraW5nIGFuZCBl
bmhhbmNlIGRlcGVuZGVuY3kgY2hlY2tpbmcgKHNhc2hpa28tYm90KQotIFJlZmluZSBjb2RlIG9y
Z2FuaXphdGlvbiBhbmQgdmFyaWFibGUgbmFtaW5nIGNvbnNpc3RlbmN5IChzYXNoaWtvLWJvdCkK
LSBMaW5rIHRvIHYyOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA1MjYta3ZtLWdldF9y
ZWdfbGlzdC12Mi12Mi0wLTc5NDBhNDAxNDU0YUBzaWZpdmUuY29tCgpDaGFuZ2VzIGluIHYyOgot
IEZpeCBGV0ZUIHN0YWxlIGZlYXR1cmUgZXhwb3N1cmUgYnkgcmVtb3Zpbmcgc3RhdGljICdzdXBw
b3J0ZWQnIGZpZWxkCi0gUmVmYWN0b3IgZ2V0LXJlZy1saXN0IHRlc3QgdG8gdXNlIHVuaWZpZWQg
ZXh0ZW5zaW9uIHN1Ymxpc3QgbWFjcm9zCi0gU3BsaXQgRldGVCB0ZXN0aW5nIGludG8gcGVyLWZl
YXR1cmUgc3VibGlzdHMgd2l0aCBydW50aW1lIGNoZWNrcwogIChBbmRyZXcpCgpUbzogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KVG86IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBs
aW51eC5kZXY+ClRvOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KVG86IFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtl
bGV5LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KVG86IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KVG86IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+ClRvOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpU
bzogU2h1YWggS2hhbiA8c2h1YWhAa2VybmVsLm9yZz4KQ2M6IGdyZWVudGltZS5odUBzaWZpdmUu
Y29tCkNjOiB2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbQpDYzogem9uZy5saUBzaWZpdmUuY29tCkNj
OiBrdm1Admdlci5rZXJuZWwub3JnCkNjOiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpD
YzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwpDYzogbGludXgta3NlbGZ0ZXN0QHZnZXIua2VybmVsLm9yZwoKLS0tCllvbmct
WHVhbiBXYW5nICgzKToKICAgICAgS1ZNOiBSSVNDLVY6IFNCSSBGV0ZUOiBGaXggc3RhbGUgZmVh
dHVyZSBleHBvc3VyZSBhZnRlciBydW50aW1lIGV4dGVuc2lvbiBjaGFuZ2VzCiAgICAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogUmVmYWN0b3IgSVNBIGFuZCBTQkkgZXh0ZW5zaW9uIHN1Ymxpc3Qg
bWFjcm9zCiAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogU3BsaXQgU0JJIEZXRlQgaW50byBz
ZXBhcmF0ZSBmZWF0dXJlLXNwZWNpZmljIHN1Ymxpc3RzCgogYXJjaC9yaXNjdi9rdm0vdmNwdV9z
YmlfZndmdC5jICAgICAgICAgICAgICAgICAgIHwgIDMyICsrKystCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAxNjggKysrKysrKysrKysrKysrLS0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTQwIGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygt
KQotLS0KYmFzZS1jb21taXQ6IGM3ODMyNTM0YTgxNjAyNzZjY2NiOWE4Y2M4Y2FmYjU2MTRjNTc5
ZDAKY2hhbmdlLWlkOiAyMDI2MDUyNi1rdm0tZ2V0X3JlZ19saXN0LXYyLWY5ZjM2OTYxYWM2YwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
