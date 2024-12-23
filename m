Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D00DE7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc5NrHNO3AqcasVQ8yJQgvaEec62l7ff5GmjBzcU4yE=; b=0JvA7B6ud4+QmM
	oYJ9kIBbCUcBOLWQqqCvIKJ84DG4jysWDFQR1cyv3o1ZlKWUYlij7vT88vKlVZ96+Vr86sWklp/Ad
	gKCDsDd3O4Jb2QUSax+CBl1gNah76lHhBmsX0KxQMiMpM5Q7/zSOOk0GyeEWS6Na5sqqdjsc7hvVR
	q/J4BxweDO8RYezPNK4/nnNczse3sgcG/eNndg6nm5x1qxVOIQW1l0ygquC45/MNaHSV0ObIcwQ26
	OpENqLmPArE/o6Gcf5PbFPay5pqg4lbjSisGXVmF1pzmLuQPec78HCrthdgjqk6MQDXVOjC+Wnl9H
	jDi023vdYxtH4Dn2GTZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdak-00000009Zlk-1sy2;
	Mon, 23 Dec 2024 08:15:06 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdai-00000009ZlD-1qCV
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 08:15:05 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-844d5444b3dso138415439f.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 00:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734941703; x=1735546503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86CBnpN2/NakznMPHxZ6qGN8CfXIz1710tMa2YbAqyo=;
        b=uxEGoIoo5ZclWk048xihgY1wJSuEHSmy1OnC3/JrS/HqOLLJ/NE0ghKh98AEu2pdi4
         BCRwjh78W0bEPmyUHCd5BkmrT4hGvxCsNGhDP5sUsQVIjnLpgigN3k8VzQy96HMd17Il
         dD+CacHWNx226wj+WCj0+rgMNV7OlZQ6Ugs4HKg4E1gakv4lL0sMLmuwdcTpOxTjuk+f
         S5NSB7VagFYTsHlh53x03nTyTtlLbwmp3xtOWFTT1YkOrLrjHauX4jHnZltDRneYAxDf
         drqFiW4IxeTIUfSQS6Q66UbyKTixh23B01I9O1tXJ+DjVRCkOo6wXpZvH36wp+znNkv5
         DdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734941703; x=1735546503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86CBnpN2/NakznMPHxZ6qGN8CfXIz1710tMa2YbAqyo=;
        b=VPIQLkSNNFmNPpIbVLkDLfRhnY+VOj/l9Eiag/EOYF/t4Vn8eggLnP9ZkccVVdztWm
         LLs0NNEEzOTaLDvcBcaFmfnsjWMyY7kaMco2z1LJoH18ivukAJGlJEvCSOQYAC3EXWOK
         tpmGMsYZaAGju6FIja5OUCPXUGbjcobIgqAtMiDlIwwKVHyIGJgkmi5XyiUpSfklb/Co
         c77g1gUbdc2CpRok7lnBifReDYIZLeCKj5cKKrntoxUBcheFEUbyz+MBbF3XgA3kXd1a
         Ieo0V5xDMG8pKk4bT7IEWkxrAJsDvC6T1pygbhiyiMT5QL9Wn5ff8SebgsYiYDP3BO48
         EKaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtM7l93FBZBJEZpBHEkDt2xiAzpMReGyUTmQnqjK+spHtXqY1H3LfUgClzljPiiWxMM0Q7fiqdquatCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrGMUzxFHh8rZgRIAj+JxaQWDOT8Tl6KfA9L9+4b6VtYHbnLi8
	aCmVwVW8YYWpH6n6PhzKxOTYoV9MkqfJO4551P8HQTaHVVKgIQ49z3TFhFJxfFES2QKdCL4tTdS
	yQsvQpKvDFWLsGImHuFqBifdO65AKTDJin0p45g==
X-Gm-Gg: ASbGncs01cnL7RUuYoNnUfMKm00e/JKL3PRPgRCTpE2++sAi7ZuCjKl808U5X6GeAKV
	4pkgVOIP8CIFMZJ7U5Z+RS+kZGsjmSEwoRK7ncuY=
X-Google-Smtp-Source: AGHT+IGQfn6e63//SwtpeJxHqZpJO48Mem4cAPQpUhscOnI2MBGvCgBCiaKADakQuG4LBt2h7aNrbQQprMZYJQUt1C0=
X-Received: by 2002:a05:6e02:1e06:b0:3a7:cff5:16d6 with SMTP id
 e9e14a558f8ab-3c2fe4458fbmr88771945ab.3.1734941702797; Mon, 23 Dec 2024
 00:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20241222033917.1754495-1-guoren@kernel.org>
In-Reply-To: <20241222033917.1754495-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Dec 2024 13:44:50 +0530
X-Gm-Features: AbW1kvZ5tQ-kTYxPVOUPr3LH9DVtW4GmEHP3Jlk_S7JBlDYUdPA6qeXxV4u0W-g
Message-ID: <CAAhSdy1EXTmuCvMp4HK0Ozg42Zw2XzCjaS7kGi-aXQ__r=taPw@mail.gmail.com>
Subject: Re: [PATCH 0/3] riscv: Add PARAVIRT_SPINLOCKS support
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com, 
	conor@kernel.org, leobras@redhat.com, peterz@infradead.org, 
	parri.andrea@gmail.com, will@kernel.org, longman@redhat.com, 
	boqun.feng@gmail.com, arnd@arndb.de, alexghiti@rivosinc.com, 
	ajones@ventanamicro.com, rkrcmar@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_001504_756926_0A42ED87 
X-CRM114-Status: GOOD (  14.77  )
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

T24gU3VuLCBEZWMgMjIsIDIwMjQgYXQgOTowOeKAr0FNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4KPiBQYXJh
dmlydHVhbGl6ZWQgc3BpbmxvY2tzIGFsbG93IGEgdW5mYWlyIHFzcGlubG9jayB0byByZXBsYWNl
IHRoZQo+IHRpY2tldC1sb2NrIG9yIG5hdGl2ZSBmYWlyIHFzcGlubG9jayBpbXBsZW1lbnRhdGlv
biB3aXRoIHNvbWV0aGluZwo+IHZpcnR1YWxpemF0aW9uLWZyaWVuZGx5LCBmb3IgZXhhbXBsZSwg
aGFsdCB0aGUgdmlydHVhbCBDUFUgcmF0aGVyCj4gdGhhbiBzcGlubmluZy4KPgo+IFlvdSBjb3Vs
ZCBvYnNlcnZlIHRoZSBwYXJhdmlydCBxc3BpbmxvY2sgaW50ZXJuYWwgd29yayBzaXR1YXRpb24g
d2l0aAo+IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvdHJhY2U6Cj4KPiBscyAvc3lzL2tlcm5l
bC9kZWJ1Zy90cmFjaW5nL2V2ZW50cy9wYXJhdmlydC8KPiAgZW5hYmxlICAgZmlsdGVyICAgcHZf
a2ljayAgcHZfd2FpdAo+Cj4gZWNobyAxID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy9ldmVu
dHMvcGFyYXZpcnQvZW5hYmxlCj4gY2F0IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvdHJhY2UK
PiAgZW50cmllcy1pbi1idWZmZXIvZW50cmllcy13cml0dGVuOiAzMzkyNy8zMzkyNyAgICNQOjEy
Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF8tLS0tLT0+IGlycXMtb2ZmL0JI
LWRpc2FibGVkCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8gXy0tLS09PiBuZWVk
LXJlc2NoZWQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IC8gXy0tLT0+IGhhcmRp
cnEvc29mdGlycQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx8IC8gXy0tPT4gcHJl
ZW1wdC1kZXB0aAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHx8fCAvIF8tPT4gbWln
cmF0ZS1kaXNhYmxlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfHx8fCAvICAgICBk
ZWxheQo+ICAgICAgICAgICAgVEFTSy1QSUQgICAgIENQVSMgIHx8fHx8ICBUSU1FU1RBTVAgIEZV
TkNUSU9OCj4gICAgICAgICAgICAgICB8IHwgICAgICAgICB8ICAgfHx8fHwgICAgIHwgICAgICAg
ICB8Cj4gICAgICAgICAgICAgIHNoLTEwMCAgICAgWzAwMV0gZC4uMi4gICAgMjguMzEyMjk0OiBw
dl93YWl0OiBjcHUgMSBvdXQgb2Ygd2ZpCj4gICAgICAgICAgPGlkbGU+LTAgICAgICAgWzAwMF0g
ZC5oNC4gICAgMjguMzIyMDMwOiBwdl9raWNrOiBjcHUgMCBraWNrIHRhcmdldCBjcHUgMQo+ICAg
ICAgICAgICAgICBzaC0xMDAgICAgIFswMDFdIGQuLjIuICAgIDMwLjk4MjYzMTogcHZfd2FpdDog
Y3B1IDEgb3V0IG9mIHdmaQo+ICAgICAgICAgIDxpZGxlPi0wICAgICAgIFswMDBdIGQuaDQuICAg
IDMwLjk5MzI4OTogcHZfa2ljazogY3B1IDAga2ljayB0YXJnZXQgY3B1IDEKPiAgICAgICAgICAg
ICAgc2gtMTAwICAgICBbMDAyXSBkLi4yLiAgICA0NC45ODc1NzM6IHB2X3dhaXQ6IGNwdSAyIG91
dCBvZiB3ZmkKPiAgICAgICAgICA8aWRsZT4tMCAgICAgICBbMDAwXSBkLmg0LiAgICA0NC45ODkw
MDA6IHB2X2tpY2s6IGNwdSAwIGtpY2sgdGFyZ2V0IGNwdSAyCj4gICAgICAgICAgPGlkbGU+LTAg
ICAgICAgWzAwM10gZC5zMy4gICAgNTEuNTkzOTc4OiBwdl9raWNrOiBjcHUgMyBraWNrIHRhcmdl
dCBjcHUgNAo+ICAgICAgIHJjdV9zY2hlZC0xNSAgICAgIFswMDRdIGQuLjIuICAgIDUxLjU5NTE5
MjogcHZfd2FpdDogY3B1IDQgb3V0IG9mIHdmaQo+IGxvY2tfdG9ydHVyZV93ci0xMTUgICAgIFsw
MDRdIC4uLjIuICAgIDUyLjY1NjQ4MjogcHZfa2ljazogY3B1IDQga2ljayB0YXJnZXQgY3B1IDIK
PiBsb2NrX3RvcnR1cmVfd3ItMTEzICAgICBbMDAyXSBkLi4yLiAgICA1Mi42NTkxNDY6IHB2X3dh
aXQ6IGNwdSAyIG91dCBvZiB3ZmkKPiBsb2NrX3RvcnR1cmVfd3ItMTE0ICAgICBbMDA4XSBkLi4y
LiAgICA1Mi42NTk1MDc6IHB2X3dhaXQ6IGNwdSA4IG91dCBvZiB3ZmkKPiBsb2NrX3RvcnR1cmVf
d3ItMTE0ICAgICBbMDA4XSBkLi4yLiAgICA1Mi42NjM1MDM6IHB2X3dhaXQ6IGNwdSA4IG91dCBv
ZiB3ZmkKPiBsb2NrX3RvcnR1cmVfd3ItMTEzICAgICBbMDAyXSAuLi4yLiAgICA1Mi42NjYxMjg6
IHB2X2tpY2s6IGNwdSAyIGtpY2sgdGFyZ2V0IGNwdSA4Cj4gbG9ja190b3J0dXJlX3dyLTExNCAg
ICAgWzAwOF0gZC4uMi4gICAgNTIuNjY3MjYxOiBwdl93YWl0OiBjcHUgOCBvdXQgb2Ygd2ZpCj4g
bG9ja190b3J0dXJlX3dyLTExNCAgICAgWzAwOV0gLm4uMi4gICAgNTMuMTQxNTE1OiBwdl9raWNr
OiBjcHUgOSBraWNrIHRhcmdldCBjcHUgMTEKPiBsb2NrX3RvcnR1cmVfd3ItMTEzICAgICBbMDAy
XSBkLi4yLiAgICA1My4xNDMzMzk6IHB2X3dhaXQ6IGNwdSAyIG91dCBvZiB3ZmkKPiBsb2NrX3Rv
cnR1cmVfd3ItMTE2ICAgICBbMDA3XSBkLi4yLiAgICA1My4xNDM0MTI6IHB2X3dhaXQ6IGNwdSA3
IG91dCBvZiB3ZmkKPiBsb2NrX3RvcnR1cmVfd3ItMTE4ICAgICBbMDAwXSBkLi4yLiAgICA1My4x
NDM0NTc6IHB2X3dhaXQ6IGNwdSAwIG91dCBvZiB3ZmkKPiBsb2NrX3RvcnR1cmVfd3ItMTE1ICAg
ICBbMDA4XSBkLi4yLiAgICA1My4xNDM0ODE6IHB2X3dhaXQ6IGNwdSA4IG91dCBvZiB3ZmkKPiBs
b2NrX3RvcnR1cmVfd3ItMTE3ICAgICBbMDExXSBkLi4yLiAgICA1My4xNDM1MjI6IHB2X3dhaXQ6
IGNwdSAxMSBvdXQgb2Ygd2ZpCj4gbG9ja190b3J0dXJlX3dyLTExNyAgICAgWzAxMV0gLi4uMi4g
ICAgNTMuMTQzOTg3OiBwdl9raWNrOiBjcHUgMTEga2ljayB0YXJnZXQgY3B1IDgKPiBsb2NrX3Rv
cnR1cmVfd3ItMTE1ICAgICBbMDA4XSAuLi4yLiAgICA1My4xNDQyNjk6IHB2X2tpY2s6IGNwdSA4
IGtpY2sgdGFyZ2V0IGNwdSA3Cj4KPiBUaGlzIHNlcmllcyBpcyBzcGxpdCBmcm9tIFsxXS4KPgo+
IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzEyMjUxMjU4NDcu
Mjc3ODYzOC0xLWd1b3JlbkBrZXJuZWwub3JnLwo+Cj4gR3VvIFJlbiAoMyk6Cj4gICBSSVNDLVY6
IHBhcmF2aXJ0OiBBZGQgcHZxc3BpbmxvY2sgS1ZNIGJhY2tlbmQKPiAgIFJJU0MtVjogcGFyYXZp
cnQ6IEFkZCBwdnFzcGlubG9jayBmcm9udGVuZAo+ICAgUklTQy1WOiBwYXJhdmlydDogcHZxc3Bp
bmxvY2s6IEFkZCB0cmFjZSBwb2ludCBmb3IgcHZfa2ljay93YWl0CgpUaGlzIHNob3VsZCBiZSBh
biBSRkMgc2VyaWVzIHVudGlsIHRoZSBjb3JyZXNwb25kaW5nIFNCSSBleHRlbnNpb24KaXMgZnJv
emVuLiBBRkFJSywgbm8gb25lIGhhcyBwb3N0ZWQgYW55IFNCSSBleHRlbnNpb24gaW4gdGhpcyBj
b250ZXh0Cm9uIGFueSBvZiB0aGUgUlZJIG1haWxpbmcgbGlzdHMuCgpQbGVhc2Ugd29yayB3aXRo
IHRoZSBQUlMgVEcgYW5kIEh5cGVydmlzb3JzIFNJRyBmb3IgdGhlIHByb3Bvc2VkClNCSSBleHRl
bnNpb24uCgpSZWdhcmRzLApBbnVwCgoKPgo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxMiArKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9LYnVp
bGQgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3NiaS5oICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcXNwaW5s
b2NrLmggICAgICAgICAgICB8IDM1ICsrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3FzcGlubG9ja19wYXJhdmlydC5oICAgfCAyOCArKysrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmggICAgICAgICAgICAgICAgICB8ICA1ICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9x
c3BpbmxvY2tfcGFyYXZpcnQuYyAgICAgICAgfCA3NCArKysrKysrKysrKysrKysrKysrCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICAgICAgICB8ICA0ICsKPiAgLi4u
L2tlcm5lbC90cmFjZV9ldmVudHNfZmlsdGVyX3BhcmF2aXJ0LmggICAgIHwgNjAgKysrKysrKysr
KysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wdmxvY2suYyAgICAgICAgICAgICAgfCA1
NyArKysrKysrKysrKysrKwo+ICAxNCBmaWxlcyBjaGFuZ2VkLCAyODMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9xc3BpbmxvY2suaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9xc3BpbmxvY2tfcGFyYXZpcnQuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9r
ZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3Yva2VybmVsL3RyYWNlX2V2ZW50c19maWx0ZXJfcGFyYXZpcnQuaAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcHZsb2NrLmMKPgo+IC0tCj4gMi40MC4xCj4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
