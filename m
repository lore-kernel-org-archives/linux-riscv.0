Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F3CCF2C4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Af/mJbr0Tx8OEXdk1HFmuDup79yPeM4+2A6BG1f8hrY=; b=ypRT8r4DI+PZhY
	rvtCjaklasrBwavDxWHrkWcB7F3ejHOuvYbOQ5imNONqgi9JTtAqmTJZ9a9eDUGoiwbm3Zfy6IX0o
	5+l3MxIXxFhu6mUBpUmI8CM8eHDn/dbvVvqvJfr9dKPupFJxztYPKCEZ2wygTnsohLm7AWgMgGMla
	S7dCkagZ6UUmMKs/5rVECtB32jtbgSWm+FzOEg/P/hOTQH9Q7ZHufa7rYyW9DOaGJG1OXvbtAyXFM
	7tzKrzLbuKnDT2QVrksammFXBjgk9i36StZqJ9ZI4qF4NBFLxuJnBy4dMWjGkMzMyMPe2nuCZUvAM
	1EmnMIBgCgkGWFdie8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnse-00000003vKo-339O;
	Fri, 16 Oct 2026 19:46:16 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnsb-00000003vK4-2FA9
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 19:46:14 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-35ef6b49813so480555eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179971; x=1792784771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrRLzPVLgizd6wdoUjViFGVj6Wd4K2T/hBmEhjqG+OU=;
        b=h6vFkcdtEOYElf3lft+4/4Ybd8nNJ6gPBsvLfWmw0r7yKwIxYlggBfpv7hX3111hv6
         jFfKyIf+FdQpglj91Sbd2xxUvHWxEeoLi4hxqYluAGwATIaxyWBkfImOaIjHz4WyeiZg
         tzaSNdWX216wVSCaagF1uQOFC8S4jiioBpyTmOnhDq9E3ieFhidx/YHZN3x7FSXGqmn2
         qT96gGdR0zUjDF1sJX+qzWcGvIQ9zZ3fgZOji3reBBiARUUmlMsTsxS8eb94l+4vVWO5
         rcvr25hlSnr0AHAzwjnU7RQux5+SYp5a28gioiS9hw8uxSEmLXL+5YmlrMbTTDvBs2o+
         GzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179972; x=1792784772;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FrRLzPVLgizd6wdoUjViFGVj6Wd4K2T/hBmEhjqG+OU=;
        b=mllUJMyTLXD2gOhsY+lIiupd5NjVy4nyf7e+Qg9p6DTqDzRkp9+NPZPR+usXn1JvuQ
         IIWYbwkuGXlg89G6kwsY1sso0D7VzxaI03U5Mm+o1u6Ql1YuXALgPKBckAhu7TVliTpk
         MZnGBN0AudhVjXfvX/yKf4cObPi/1lYfQjz5jtkfv85Uccs2h0bB6C862roNLa7+Cg2Y
         mR4JUIMY1lMqVk+FuzAClt6AmPFJVsG/YbKw2c3+xz68x1A4Yzcb5In+1pZAsqusgC9j
         bsCIOYwdLoyEwTjAxb6vKOnFXldKIoxFmCCPZo+p9ipCPAkcKL7WFtwMcag6llafcMKY
         tS4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJnL6bNABYRFjfg1s0Qjpab+GkClLgtIbKiug57AlwKD7DNeEhl9FeAgmj6wYn2Nc5tn8QDhB0eT2eEQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLHD6OQldRVpHlYdDrxb/NxA24yqQIu3C9VnpZqnyAEJ/sc1MEs
	s6OWFaQK1hN6IDpV5OmknjFJTWv3bs/Oo+Wo10Y0YkSdyLrs0GaWv0KQ
X-Gm-Gg: AYBFou2lfTsLPN1lzWeo7+h6NLhJT/95V164pK1SbovQh3Qj83MdggwEdyUxRcQI+Bp
	9A2nuJm5AZEIAs2+Sl6+SnE9sB95rndRhjhZ4ueWIXprtAYE74YLncQZioemjrv/AwHfQ6MGEcI
	abtmQnPcUzXuGwz6eQpvAtFOhy5Uz01EtcFf4ILYsp8uysat1V9t5uv7Jc7KGa9lsoswi5+olmq
	dL8esxuTmLcZ4DoYlcZrYQyLhpsxb1EmPcXUkvwf+qCAauxS6OmVllifW1Vth/P6DoWTeYw1w9m
	Ogmy4XkLCtNN+1dLT4bh/hQntv5E6CuDVpdgVdoskHwjaAg3v5KiyD2U+BLtk+WfdcwOZYBYnjy
	ckvRNYHTa02v1MqqeBm4ERCWttVHmbVFs7UabTtd6RzQ+nR2wnvsugTmbJcfX6zBonzhCSkQ8tI
	bsjC89HY9qSQq2iJIuqnYRR4bHNcHZnNQDzDjMPI0oLg9WUcaUeihtF+zEZ5cMI6f6
X-Received: by 2002:a05:701b:4212:20b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1850c40d561mr1220093c88.4.1792179971397;
        Fri, 16 Oct 2026 12:46:11 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm11008321c88.16.2026.10.16.12.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 12:46:10 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Fri, 16 Oct 2026 16:45:59 -0300
Message-ID: <cover.1792179433.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_124613_575021_3E30F08E 
X-CRM114-Status: GOOD (  12.59  )
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

VGhpcyBpcyBub3QgYSBwb3J0IG9mIHRoZSB4ODYgVExTIGZpeCBpIHNlbnQgeWVzdGVyZGF5LiBU
aGF0IGxlYWsgd2FzIGluc2lkZQpjb3B5X3RocmVhZCgpIHdoZW4gc2V0X25ld190bHMoKSBmYWls
ZWQsIHNvIGNvcHlfcHJvY2VzcygpIHNraXBwZWQKZXhpdF90aHJlYWQoKS4gSGVyZSBjb3B5X3Ro
cmVhZCgpIHJldHVybnMgMCBhbmQgYSBsYXRlcgpjb3B5X3Byb2Nlc3MoKSBzdGVwIGZhaWxzLiBU
aGUgY29uY3JldGUgaG9sZSBpcyBjbG9uZTMoKSB3aXRoCkNMT05FX1ZNfENMT05FX1BJREZEIGFu
ZCBhbiB1bndyaXRhYmxlIHBpZGZkIHBvaW50ZXI6IHB1dF91c2VyKCkKcmV0dXJucyAtRUZBVUxU
IGFmdGVyIHRoZSBhcmNoaXRlY3R1cmUgaGFzIG1hcHBlZCBhIHNoYWRvdyBzdGFjay4KZXhpdF90
aHJlYWQoKSBkb2VzIHJ1biwgYnV0IGFybTY0IGFuZCByaXNjdiBkaWQgbm90IGltcGxlbWVudCBp
dCwgc28KdGhhdCBtYXBwaW5nIHN0YXlzIGluIHRoZSBwYXJlbnQncyBtbS4KCk5vcm1hbCBleGl0
IGFscmVhZHkgZnJlZXMgdmlhIGRlYWN0aXZhdGVfbW0oKS4gVGhlIGZhaWxlZC1mb3JrIHBhdGgK
bmV2ZXIgcmVhY2hlcyB0aGF0LiBUaGUgZnJlZSBoZWxwZXJzIGFscmVhZHkgcmVmdXNlIGEgZm9y
ZWlnbiBtbQphbmQgYSBjbGVhcmVkIGJhc2UsIHNvIHdpcmluZyB0aGVtIHRvIGV4aXRfdGhyZWFk
KCkgZG9lcyBub3QgdW5tYXAKdGhlIHBhcmVudCBvbiAhQ0xPTkVfVk0gb3IgZG91YmxlLWZyZWUg
b24gYSBub3JtYWwgZXhpdC4gQQpzdWNjZXNzZnVsIGNsb25lMygpIGNoaWxkIHdpdGggdGhlIHNh
bWUgZmxhZ3MgZXhpdHMgdGhyb3VnaApkZWFjdGl2YXRlX21tKCkgYW5kIHRoZW4gZXhpdF90aHJl
YWQoKTsgdGhhdCBpcyB0aGUgdXN1YWwgdGVhcmRvd24Kb3JkZXIgdGhpcyBzZXJpZXMgYWxzbyBl
bmFibGVzLgoKcmlzY3YncyBzaHN0a19yZWxlYXNlKCkgY29tbWVudCBhbHJlYWR5IGRlc2NyaWJl
ZCB0aGlzCmV4aXRfdGhyZWFkKCkgY2FsbC4gVGhlIGFyY2hpdGVjdHVyZSBuZXZlciBzZWxlY3Rl
ZApIQVZFX0VYSVRfVEhSRUFELCBzbyB0aGUgZG9jdW1lbnRlZCBwYXRoIHdhcyBub3QgY29ubmVj
dGVkLgoKRG8gbm90IGZyZWUgb24gYSBjb3B5X3RocmVhZCgpIGFsbG9jYXRpb24gZXJyb3I6IHRo
ZSBjaGlsZCBzdGlsbAphbGlhc2VzIHRoZSBwYXJlbnQncyBiYXNlLCBhbmQgY29weV9wcm9jZXNz
KCkgc2tpcHMgZXhpdF90aHJlYWQoKQp3aGVuIGNvcHlfdGhyZWFkKCkgZmFpbHMuIGtlcm5lbF90
aHJlYWQoKSB1c2VzIENMT05FX1ZNLCBzbyBhCmZhaWxlZCBjb3B5X3Byb2Nlc3MoKSBzdGlsbCBz
aGFyZXMgdGhlIGNhbGxlcidzIG1tIGFuZCB0aGUgbW0gY2hlY2sKaW4gdGhlIGZyZWUgaGVscGVy
cyBkb2VzIG5vdCBzYXZlIHVzOyB0aGUga3RocmVhZCBwYXRoIGNsZWFycwppbmhlcml0ZWQgdHJh
Y2tpbmcgZm9yIHRoYXQgcmVhc29uLgoKVGhlIHNlbGZ0ZXN0cyBhc3N1bWUgL3Byb2MgaXMgbW91
bnRlZC4gQSBjbG9uZTMoKSB3aXRoIGEgdmFsaWQKcGlkZmQgbXVzdCBzdWNjZWVkIGFuZCB3cml0
ZSBhIHBpZGZkIGJlZm9yZSB0aGUgcmVqZWN0ZWQgY2FsbHMKY291bnQuIEVOT1NZUywgRUlOVkFM
LCBhbmQgRVBFUk0gZnJvbSB0aGF0IGNsb25lIHNraXA7IGFueSBvdGhlcgplcnJvciBmYWlscyB0
aGUgdGVzdC4KClNpeHRlZW4gY2xvbmUzKCkgY2FsbHMgd2l0aCBDTE9ORV9WTXxDTE9ORV9QSURG
RCBhbmQgYW4gdW53cml0YWJsZQpwaWRmZCBwb2ludGVyIGxlYWtlZCAxNiBzaGFkb3ctc3RhY2sg
Vk1BcyB3aXRob3V0IHRoZSBmaXguIFdpdGggaXQsCnRoZSBjb3VudCBzdGF5ZWQgdW5jaGFuZ2Vk
IGFuZCBjYWxsL3JldHVybiBvbiB0aGUgcGFyZW50IHN0aWxsIHVzZWQKdGhlIG9yaWdpbmFsIG1h
cHBpbmcuCgpCYXNlOiAyZjJmN2VlZWY4YjAgKCJNZXJnZSB0YWcgJ3NvYy1maXhlcy03LjMtMycg
b2YKZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3NvYy9zb2Mi
KS4KCmFybTY0OiBRRU1VIDExLjEuMiAtbWFjaGluZSB2aXJ0IC1jcHUgbWF4LCBDT05GSUdfQVJN
NjRfR0NTLCBvbmUKdkNQVS4gVW5wYXRjaGVkIHNzX3ZtYXM9MS0+MTcgKCs1MTIga0IpLiBQYXRj
aGVkIHNzX3ZtYXM9MS0+MS4KCnJpc2N2OiBRRU1VIDExLjEuMiAtbWFjaGluZSB2aXJ0Ci1jcHUg
cnY2NCx6aW1vcD1vbix6Y21vcD1vbix6aWNmaXNzPW9uLCBDT05GSUdfUklTQ1ZfVVNFUl9DRkks
IG9uZQp2Q1BVLiBVbnBhdGNoZWQgc3Nfdm1hcz0xLT4xNyAoKzEwMjQga0IpLiBQYXRjaGVkIHNz
X3ZtYXM9MS0+MS4KCkFzc2lzdGVkLWJ5OiBMTE0KCkl2w6FuIEV6ZXF1aWVsIFJvZHJpZ3VleiAo
NCk6CiAgYXJtNjQvZ2NzOiByZWxlYXNlIEdDUyBvbiBmYWlsZWQgZm9yawogIHJpc2N2L3Noc3Rr
OiByZWxlYXNlIHNoYWRvdyBzdGFjayBvbiBmYWlsZWQgZm9yawogIHNlbGZ0ZXN0cy9hcm02NDog
R0NTIG11c3Qgbm90IGxlYWsgb24gYSBmYWlsZWQgY2xvbmUzCiAgc2VsZnRlc3RzL3Jpc2N2OiBz
aGFkb3cgc3RhY2sgbXVzdCBub3QgbGVhayBvbiBhIGZhaWxlZCBjbG9uZTMKCiBhcmNoL2FybTY0
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9hcm02NC9r
ZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgICAgICAgICAgIHwgIDIxICsrCiBhcmNoL3Jpc2N2L0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvY2Vzcy5jICAgICAgICAgICAgICAgICAgIHwgIDE4ICsKIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2FybTY0L2djcy9NYWtlZmlsZSAgICB8ICAgMyArLQogLi4uL3NlbGZ0ZXN0cy9hcm02
NC9nY3MvZ2NzLWNsb25lLXBpZGZkLmMgICAgIHwgMzU1ICsrKysrKysrKysrKysrKysrKwogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL01ha2VmaWxlICAgIHwgICA1ICstCiAuLi4v
c2VsZnRlc3RzL3Jpc2N2L2NmaS9zaHN0ay1jbG9uZS1waWRmZC5jICAgfCAzMTcgKysrKysrKysr
KysrKysrKwogOCBmaWxlcyBjaGFuZ2VkLCA3MTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9nY3Mv
Z2NzLWNsb25lLXBpZGZkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9yaXNjdi9jZmkvc2hzdGstY2xvbmUtcGlkZmQuYwoKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
