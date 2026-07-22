Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0346C4452D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cAlQivdenPtPKLyoyMlN50DzA18NJDzz8DGivqbkidQ=; b=RL6fUAmDAAf3sQ
	oDtwlRpstTSS0b/Q+P6ASyp292e5maKSJdinesiI4edZXCsXIciF41y8mRhMXtOdYRboZDo5aabke
	TmSczzd3msEuaI7P/gH27pnhmEm0h90UC3c1CsrJj7d2bxgiOu5b0KEQFzc5ZuOcIaxy4YOtl2emo
	G0HaUMxDznRKt0vwD7g+5/9bjw12S18rbufU8B/kXbBkuvJRunnpUwVY1rAl55sWAGLEZS4aaFfSx
	TYxFDYSw7mc/f5C5raaYXUk8BQrqWxiZ16l0xgxUBWEOYhoatJjFfmwYmA6jSTYtOHEBROlMfy7LO
	6uwx5nybZC4AHbxr56aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPsI-0000000AwNA-3AMO;
	Wed, 22 Jul 2026 05:52:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPsG-0000000AwLU-03oC
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 05:52:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc61541f8cso69883365ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 22:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784699526; x=1785304326; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0UoHHKoOPl3ZY84JSAlc+YP4ytsZ7MKt8w4OspWuvXQ=;
        b=cSXuKFt6fKxOqFt3FQPUChfxnnAzlzmCFv5G7vQ7kdwDXwb0Rh7lBYUANv9M6jyzon
         vn9zDybA+ji+sR7oDpHwd73EVRBD+0b5EROKmBWDFI2fpciAtlCLx8Q/Q1KR5r7Km9AE
         ZKGQ3EDh2as3VAutEUKK21kxaxtV7Xh251YQnhruYMkiNbBtwl3ut4kxnBgIV7WXEUZ9
         DYK25FZcheZZBhMkNT78sIIQo/xistZ4K31diADHYHtolFIOD/aeJ7+UbJcagg5LI8IQ
         NzyDw9pUavMSbHUCmT8mvykrmy69H8l3SU7w4liXmvHdvwnLbDdk60wVkVT6u9aeQsHn
         lDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699526; x=1785304326;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0UoHHKoOPl3ZY84JSAlc+YP4ytsZ7MKt8w4OspWuvXQ=;
        b=fIWMfT0/E1kxK4wWeiIwwKj5UjbdZMSnhuGsYcik/ln38iKyzMkwRlctAuap+DY92Y
         jrggLjttnK0jVzNxl7g+Z8GEjlEfoGsOtFaIUhLMY7EEtdGCeUMoQH1muyrNsm5Jl23U
         j2xClSX4PN8wiKdngViXBBkebvhPTKQYPdlqauGnwIDaxaQ8349l7EATcYZ2mJQ4XbTS
         jfaH7HJzAnXbIsiMMvCoucG7YFiacmKoxjOwJnCbMiw/j6iKpMIAJu8/Xq/Oxes3pUla
         7sras6k9mfOWsl3q4XA3fwlzSddPtL1AFv9ctmvUna+3B5Bwdg3aJRdGb40CrsBybpTx
         qwog==
X-Forwarded-Encrypted: i=1; AHgh+RpvS4HdSrpCSozuiaLjYdyls0pxaOCCSx7eV/C2VbdUmltCIwhEyT7Yf8VR/f++NtHJ7eBEn7ljklzUgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1lE7ts44jUndTc/Q3BUOZcONWfXGCPXhRgFXOQkySge6Tmkrt
	1lZDLyAA/xoYZg3JHy/POG+jHgq+rR8LQh01YfMLKQbVxgJV2Pz+Wior9iuyJVbQeyg=
X-Gm-Gg: AR+sD11NjPLEF86G8jnO2KVc9V6puFzdyZf09Wp4CMk9PcX4WHvnoUC0keH8fkBah7d
	Qf3Q82DFWDfGaUnIHwHBx0srKFQnXA23B3+Ii3NoZt+p8/FD2dCf/dKbHhmRx608WP8iOk602x0
	lxu1cMuMlopHHJRMsfOhOSfF3qzuRkrb3X7fJ9mJXyh+5+0kFIJOBREY8ycHmxk8kjvg1/cRct9
	qsHQl6q509VfMskKCVf2NbpIsVX5khXDaM9E2uJchoSARauruUREdyk6kkmCUz5+1SVlO9kRg3S
	7Rhud18t6sDJvkAKpfL0c5SHOlhjS26MsBn8O9xTIVEAIMzERqXMweGWwY8uDdd5wZ/Ni0XAqLs
	SLsNcFVg47q064062ydgFh+sPcsjfnDTBc4j3Q0ndrWvSb05XQL/sX66SkMLQVeQbI+8ZI55nUP
	MxhXYKUu2MBgLwXn9CUWQShQ==
X-Received: by 2002:a05:6a20:ce4b:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c42921dfadmr2765901637.2.1784699526235;
        Tue, 21 Jul 2026 22:52:06 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm5133138eec.23.2026.07.21.22.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:52:05 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v4 0/2] KVM: RISC-V: Add CPU PM notifier for non-retention
 idle states
Date: Tue, 21 Jul 2026 22:52:01 -0700
Message-Id: <20260721-kvm-cpu-pm-v4-0-146bf942547d@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIFaYGoC/3XNTQ6CMBCG4auQrh3TlhbBlfcwLtoylWr4SQuNh
 nB3ATcSdfkl87wzkoDeYSDHZCQeowuubeYhdgkxlWquCK6cN+GUZzTjAu6xBtMN0NVQCCaYQlN
 Kq8gMOo/WPdbY+fLeYdA3NP1SWC4qF/rWP9dvkS13P8ORAQPJaZ4j4wcl5Sk46yLuTVuTpRz5p
 802lgMFcchRos1LU+gvm/636Ww1UsmUslhotbHTNL0AMbxDpC8BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784699525; l=2510;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=E8ESqQTJHQds29ywYe98l3PNnwPah/MYc1or4uViX2U=;
 b=/5y2v7B+7bTyOPu2zSHbzaY5YFy8gy6seqqoYgbD5kzYDcC9ez988VYREXyaW+hQ5ijlBUPj5
 7KOT25te1zxAUrVtf1zaP7UgrWbXX0fbTE4P76YZwoYZrrcdCn2Ri8C
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_225208_110310_EDAC4F10 
X-CRM114-Status: UNSURE (   8.92  )
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
bWVjaGFuaXNtcy4KCi0tLQpDaGFuZ2VzIGluIHY0OgotIFJlbW92ZSB0aGUgc3lzdGVtX3N0YXRl
IGNoZWNraW5nIChzYXNoaWtvKQotIExpbmsgdG8gdjM6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGlu
ay8yMDI2MDYyNi1rdm0tY3B1LXBtLXYzLTAtYmUwNTFhYWZlOWJhQHNpZml2ZS5jb20KCkNoYW5n
ZXMgaW4gdjM6Ci0gUmVtb3ZlIHRoZSBlcnJvciBrdm1fcmlzY3ZfbmFjbF9kaXNhYmxlKCkgY2Fs
bCBpbiBrdm1fcmlzY3ZfY3NyX2Rpc2FibGUoKQooc2FzaGlrbykKLSBVbnJlZ2lzdGVyIENQVSBQ
TSBub3RpZmllciBmaXJzdCBpbiByaXNjdl9rdm1fZXhpdCgpIChzYXNoaWtvKQotIExpbmsgdG8g
djI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDYyNi1rdm0tY3B1LXBtLXYyLTAtNDc4
ZTVlZjhkYzliQHNpZml2ZS5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkIHBhdGNoIDEgZm9yY2Ug
cmVzdG9yZSBWQ1BVIGFmdGVyIHBvd2VyIHN0YXRlIHRyYW5zaXRpb25zIChzYXNoaWtvKQotIEFk
ZGVkIENQVV9QTV9FTlRFUl9GQUlMRUQgZXZlbnQgaGFuZGxpbmcgKHNhc2hpa28pCi0gT3B0aW1p
emVkIEhHRUlFIHNhdmUvcmVzdG9yZSB3aXRoIHNhdmVkX3ZhbHVlIGZpZWxkIChzYXNoaWtvKQot
IEZpeGVkIEhJRSBDU1IgcmVzdG9yYXRpb24gaW4gbGlnaHR3ZWlnaHQgaWRsZSByZXN1bWUgcGF0
aCAoc2FzaGlrbykKLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA2
MjQta3ZtLWNwdS1wbS12MS0xLTUyMDg4ZTEyN2E1NUBzaWZpdmUuY29tCgotLS0KClRvOiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpUbzogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4KVG86IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgpUbzogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KVG86IEFsYmVydCBPdSA8YW91QGVlY3MuYmVy
a2VsZXkuZWR1PgpUbzogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgpUbzogUmFkaW0g
S3LEjW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KVG86IEFuZHJldyBKb25l
cyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+ClRvOiBOdXR0eSBMaXUgPG51dHR5Lmxp
dUBob3RtYWlsLmNvbT4KVG86IEppbnl1IFRhbmcgPHRqeXRpbWlAMTYzLmNvbT4KQ2M6IGdyZWVu
dGltZS5odUBzaWZpdmUuY29tCkNjOiB2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbQpDYzogem9uZy5s
aUBzaWZpdmUuY29tCkNjOiBrdm1Admdlci5rZXJuZWwub3JnCkNjOiBrdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwoKLS0tCllvbmctWHVhbiBXYW5nICgyKToKICAgICAg
S1ZNOiBSSVNDLVY6IENsZWFyIGZvcm1lciBWQ1BVIGNhY2hlIG9uIHZpcnR1YWxpemF0aW9uIGRp
c2FibGUKICAgICAgS1ZNOiBSSVNDLVY6IEFkZCBDUFUgUE0gbm90aWZpZXIgZm9yIG5vbi1yZXRl
bnRpb24gaWRsZSBzdGF0ZXMKCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaCAgfCAg
MTUgKysrLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgICAyICsKIGFyY2gv
cmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICB8IDE0NCArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAgIHwgIDg5
ICsrKysrKysrKysrKysrKysrKy0tLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAg
ICAgfCAgMTEgKysrCiA1IGZpbGVzIGNoYW5nZWQsIDE3OCBpbnNlcnRpb25zKCspLCA4MyBkZWxl
dGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA1MjczODM1MmE2ZjI5Mjc5ZTE1Mjg1ZmNiN2I1MDI0
MWVmODY3ZTI3CmNoYW5nZS1pZDogMjAyNjA2MjQta3ZtLWNwdS1wbS05NDE0MWFlY2Q1ZmEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
