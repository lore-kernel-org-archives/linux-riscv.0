Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA7FCDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K7ISr+yZM1Vfdz6bn6D3LmjVRAV7GkQs5qlURoO0FtE=; b=j9H12G5T0hE0It
	xZdjsj0qmlSycehLXRWkYfW5+k6ihINh3DBTTNcTWr2MfHJPRpB0Im72VH3k1XM59rtUqC9pigA05
	qZOFHk9pCUkNPDGaZPgJxDI+M/xsl3GYvuO8VlOlpM/cDxn7ddzIhkWac6OeCdVSzbv3/lF/E7zu4
	waY2PJ811Ahq061wZ9veC1p5FO7XVWpUYc7duvHa6EU/X3Fo2pF1j0N8UHC65kaMuV7Bl1FpuXV3+
	lLgSIrfKxlmtjvZNGO8QQiSVu9XEEajvqbqcJhsq0R3Dsh3239NH3Nh8/Q8IdwqA8Ve8hxUAPZol3
	IoFc1Y4jz/RhwHAKxqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1r2-0000000Aqjo-1u0h;
	Fri, 26 Jun 2026 08:24:04 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qy-0000000Aqg2-0EZa
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:24:03 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-13986d61b4eso2094305c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782462239; x=1783067039; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ccpgKTbVU35FcpL6ebiWIfE77fSWC1R9tsT9g07kXw=;
        b=Q0n+AdxG1YHyZx3kCjZUAY4OAcDgakAAvcPWgkMWqK5cM6ql77cGVwoP3GtJ8bI3DO
         NAj+QYadzM41vw/0NWZeCw4/TX47dZqJDVOP9NEP9eRXgEa40tjSQIpg/idAmXDgKXqY
         rareX2TOiXmIk0F68K602YzZV1VLcHVQyIhdQAZf0wdSkwBeHZNPedB0Cs1SkhxQVdZv
         xVpoSyQcNmMGvesMfXWYdQ+H58uzAg/Alld91Dt2KqhYKhLAgGeDvCKMMG/UEYlw3HH9
         WdmLcrlZEl3IeiLY6jqnJAAPQCKbdF53ONU0wyOQnhtY8vKDVdeQLxKCDeAYfohzMgjS
         jrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462239; x=1783067039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ccpgKTbVU35FcpL6ebiWIfE77fSWC1R9tsT9g07kXw=;
        b=Cz++F7sJLR1RjunsIy5YG1hIaMLQyl1GLYKgYE0XOgs1dI4pFHEmkdxolOsyKQeXAD
         yHp+w7LRoUeO9W9VhzCOeslIQ2d5Cx+co3YpzMpZzYqoXh2yb8bDFBLQSxpgdh38nfg7
         gGph1OWc3ni+8YDSzBHNM+NWzHjiwWfqMc/G49T9auQ16N9DFPZW8B0H2kdU1UTyLh60
         SEA24fout/AQaizvmqiaatwFocrsnTqHK5m8FoyGmOdRmhmcjIe7FaYpzHnbedCMFX3a
         Tcb5MnjNG4mNlh07Oj0sTeYGzaQi+wQibBIUM6mU5P7OLsoZ6VVSSD2KhoqJGgVWC6l6
         /oGw==
X-Forwarded-Encrypted: i=1; AFNElJ8cYnnF3E/baC/iUlhQEq5yZFKmdE0f0Pm/llTm+R2FHq7c9rFuNmkyBTqvQSiOBUkjNUL6qp38CByoIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNXJjnWlt7v08TGIndIAlHdzEdD8136zH5FeWx4gu6FOU5k9k+
	RhMwyZAClWinZ4jRfb97n5dvRJs3Q0ZivaRJaNJLPYqcD17FTBzFGbS21JJR1fcSmwM=
X-Gm-Gg: AfdE7clRbffU7NMagsNG+DnmTMEyq3ELQEAAaWbCWm3whpGVz+kAfjERWbDplf9Ax0G
	5EM+dXcGeIvYVr2u0LgdgffG2PkmS1+gBf9eUoZWUsmzIQ5tXuj85hdufuqS2ivacfgjGSqoQDp
	jJBY4bhjChC1e+ZMcdyt52qD9SpUNAvBAnB8TLyFD7PabakbWF4cw+t4DnzRtJibq+dufiZr0o7
	FAw1srE1dLH5ecKeuQz0rzp2L1xbkOeenz3ju9KyNMSdgmcA6Db0mxQSBlrRBXLd+nwaCWVPGm7
	67SB9TfsqaJoF0DczJX2XAaVXwqcufUjwhG6ueAByTf/nQeMHzmHdv4abbocTuFe/yOGP9egfDX
	Iepgl69Q322Ma1ZULqRsp6DbXI4GtfXm/2Khxb5Z0av9N2XR/mzC+a+Wi+HGlgGEVUQj5dZ2umY
	b3T+u9fxf21wAqBE6grkF21j0aH3wjajiUN3SaBOBp9H4=
X-Received: by 2002:a05:7022:4597:b0:136:c565:e862 with SMTP id a92af1059eb24-139dbb529f0mr4508204c88.26.1782462238802;
        Fri, 26 Jun 2026 01:23:58 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm15557199c88.3.2026.06.26.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:58 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v2 0/2] KVM: RISC-V: Add CPU PM notifier for non-retention
 idle states
Date: Fri, 26 Jun 2026 01:23:20 -0700
Message-Id: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPg2PmoC/22Nyw6CMBBFf4XM2jFtQxFd+R+GRS1TGQ2PtNBoC
 P9ui1uXJzn33BUCeaYAl2IFT5EDj0MCdSjAdmZ4EHKbGJRQlahUia/Yo50WnHo8l7KUhmyrnYE
 0mDw5fu+xW/PjsNyfZOdcyEbHYR79Z3+LMnt/w1GiRK1EXZNUJ6P1NbDjSEc79tBs2/YFdeOEK
 bcAAAA=
X-Change-ID: 20260624-kvm-cpu-pm-94141aecd5fa
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782462237; l=2099;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=aOcN8mnYJvpUbDHzKnJv3eWv6lFjVcVGulc7fYXjqSU=;
 b=giWvwAPg7EAWMUg2prEKaAltGBPuyswuvK1/Q0rWzme2xOkcN1QD/CpdhHYbwsyAYOxyuNWiG
 DcsF+dE2RumAj+v9AFM++BmT1nwPZnp8MWfxtu77AhMM5SrE3OOXSOs
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012400_099831_12DF3944 
X-CRM114-Status: UNSURE (   8.20  )
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

VGhpcyBzZXJpZXMgYWRkcyBDUFVfUE0gbm90aWZpZXIgc3VwcG9ydCB0byBzYXZlIGFuZCByZXN0
b3JlIGh5cGVydmlzb3IKQ1NSIHN0YXRlIHdoZW4gQ1BVcyBlbnRlciBub24tcmV0ZW50aW9uIGlk
bGUgc3RhdGVzIHdoZXJlIHRoZSBDUFUgZG9tYWluCmlzIHBvd2VyZWQgb2ZmLgpQYXRjaCAxIGZp
eGVzIGEgVkNQVSBjYWNoZSBpbnZhbGlkYXRpb24gYnVnIHRoYXQgY291bGQgY2F1c2UgaW5jb3Jy
ZWN0CkNTUiByZXN0b3JhdGlvbiBhZnRlciBwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucy4KClBhdGNo
IDIgaW1wbGVtZW50cyB0aGUgQ1BVX1BNIG5vdGlmaWVyIHRvIGhhbmRsZSBDU1Igc2F2ZS9yZXN0
b3JlIGR1cmluZwpDUFUgaWRsZSwgY29tcGxldGluZyBLVk0ncyBwb3dlciBtYW5hZ2VtZW50IGNv
dmVyYWdlIGFsb25nc2lkZSBleGlzdGluZwpDUFUgaG90cGx1ZyBhbmQgc3lzdGVtIHN1c3BlbmQg
bWVjaGFuaXNtcy4KCi0tLQpDaGFuZ2VzIGluIHYyOgotIEFkZCBwYXRjaCAxIGZvcmNlIHJlc3Rv
cmUgVkNQVSBhZnRlciBwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucyAoc2FzaGlrbykKLSBBZGRlZCBD
UFVfUE1fRU5URVJfRkFJTEVEIGV2ZW50IGhhbmRsaW5nIChzYXNoaWtvKQotIE9wdGltaXplZCBI
R0VJRSBzYXZlL3Jlc3RvcmUgd2l0aCBzYXZlZF92YWx1ZSBmaWVsZCAoc2FzaGlrbykKLSBGaXhl
ZCBISUUgQ1NSIHJlc3RvcmF0aW9uIGluIGxpZ2h0d2VpZ2h0IGlkbGUgcmVzdW1lIHBhdGggKHNh
c2hpa28pCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNjI0LWt2
bS1jcHUtcG0tdjEtMS01MjA4OGUxMjdhNTVAc2lmaXZlLmNvbQoKLS0tCgpUbzogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KVG86IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51
eC5kZXY+ClRvOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KVG86IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5
LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KVG86IFJhZGltIEtyxI1t
w6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+ClRvOiBBbmRyZXcgSm9uZXMgPGFu
ZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgpUbzogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90
bWFpbC5jb20+ClRvOiBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+CkNjOiBncmVlbnRpbWUu
aHVAc2lmaXZlLmNvbQpDYzogdmluY2VudC5jaGVuQHNpZml2ZS5jb20KQ2M6IHpvbmcubGlAc2lm
aXZlLmNvbQpDYzoga3ZtQHZnZXIua2VybmVsLm9yZwpDYzoga3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKCi0tLQpZb25nLVh1YW4gV2FuZyAoMik6CiAgICAgIEtWTTog
UklTQy1WOiBDbGVhciBmb3JtZXIgVkNQVSBjYWNoZSBvbiB2aXJ0dWFsaXphdGlvbiBkaXNhYmxl
CiAgICAgIEtWTTogUklTQy1WOiBBZGQgQ1BVIFBNIG5vdGlmaWVyIGZvciBub24tcmV0ZW50aW9u
IGlkbGUgc3RhdGVzCgogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggIHwgIDE1ICsr
Ky0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAgMiArCiBhcmNoL3Jpc2N2
L2t2bS9haWEuYyAgICAgICAgICAgICAgfCAxNDQgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAgICAgICAgICAgICB8IDEwMCArKysr
KysrKysrKysrKysrKysrKystLS0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
IHwgIDExICsrKwogNSBmaWxlcyBjaGFuZ2VkLCAxODkgaW5zZXJ0aW9ucygrKSwgODMgZGVsZXRp
b25zKC0pCi0tLQpiYXNlLWNvbW1pdDogNTI3MzgzNTJhNmYyOTI3OWUxNTI4NWZjYjdiNTAyNDFl
Zjg2N2UyNwpjaGFuZ2UtaWQ6IDIwMjYwNjI0LWt2bS1jcHUtcG0tOTQxNDFhZWNkNWZhCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
