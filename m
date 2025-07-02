Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00CBC83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 18:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NCp/EXZjy9xBU1WNW6+T6x9pOpXf7koHp39ZWIiiwhs=; b=xNUIR5bzMBATgSrVI0f0Yaj7b2
	TbArd/b/8ipB6s035plBQ4aAq3a7wDdk8g8MKdu9WouhCWVZJbYYueni+/hFC44hY4B8ozptS6457
	hv/1nP/NYmx6txAHtos5iob6ITlXieDv2Gxc5t0I8btpch3HKbf/UyM+Sf/engyAJW3XLA5CFeo9U
	vyCFZslCKkeXP2v9ySMcDjdvXA2GW4mji0VfwvQWy9IdnliWS+43I7X4XYU+nZaIOt5NsUTX2cmlY
	G7lVEbKffHWLp4jyKhvZ6mzblUhTUWzLiL+QcFRquBJMFfKD63F2SrRLfsM7XEXZucsqqMd71KDAN
	ttSWlGfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1lZ-00000009DH3-3oGj;
	Wed, 02 Jul 2025 18:01:05 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1jb-00000009D29-0XuD
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 17:59:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so163838b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751479142; x=1752083942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1icsQ8UTjR9FPGOeFQqCEoC9s2SgWWoNfnxh3d/o6Ag=;
        b=cJnsCFwu2DrJiWls/lhq45whC/Plr5/xY8kv7JFHBfJQ4VcVPRYb9UwJmFDrnZ5ujM
         81aovDxZPyQgg6ooO5Y9ONfBXR3pA/yH/FNFdkg3jQbez2g+gyfFeEaffckwqYotPzD2
         dBpGDcPL8fsC7xfnIpzDH2tmv/BQARxjWMnX2cvJPpNKEplfNPACmPNROtos8XX1S+N9
         2Ha0BEtl+rEyDWhO6TBvP6vwoOBDfwzblhzj1xv9cRuiV50QDGULbWR3tvlakfw6nJI9
         klM5yKgQp030v8GG6NSxgvg0Maeyn55aN8Fclu9PPLZDwZip2z5XDd8WgmrB54+IyLBa
         iuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751479142; x=1752083942;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1icsQ8UTjR9FPGOeFQqCEoC9s2SgWWoNfnxh3d/o6Ag=;
        b=Gmw5VEkoLNZtWyvjtbbF3IomcfWN35asIaBiMYm1fGi+cUUKNY0H7HiZW2y5NecxSN
         vTbNXp6bIui4eVCW/G2lBwHZPBBf4ZJQzeVaE1CRR6kxUYL7IlOzin9I8Ts6rbChbROZ
         rp5No1E9bnHmeUTOfhbYv5BeMSAi6KXDjJEuOyvJ9Y6WHr93MEE2IJhJiOubJD3Yt2bi
         jwQ12pbOMwzSJ2/U6hbCYkjayHvRaaZMXj+v+DrNW4QAzTIB2WHCuC0+udPlBO+CuZ2W
         fprwG9vIrT63mVvpb7LxHKWxuiBRlOhfIz85OsaFLd6VHiyKtVIJWDiQietMKju8tiIX
         jihw==
X-Gm-Message-State: AOJu0YxTkqLPcTEzIaVqlNwsZMNurd1b97gj6ndlgR887zL1iBEtmMwJ
	mmk3RPcAJ1bkUzC5FcOQyDQhvosCsPxeEKhduNO0dTt2YW70JsHNvWIHtEWvK9YhCABrpCZkia+
	q/F6yM7U=
X-Gm-Gg: ASbGncvD/9Z0xOIz02Akpe7BMEAbKODhIHaWKfXMIXYXGmzp6tsDLdWxqbxWOE4kXZr
	P4YOs6EqPxxRSBP4CUQsaRGnlxbrwn01kB+5tmYIZH59CRV6T3SxCSufZOLHSiyd9tH1KQ5AoEQ
	BwoPnxz9aFJ0urcWCB8K7hmFZ0XE5F/hbpskzrR52wwOg6qrxa8dEHp4BbM61jMriRxbxZixRdc
	KOmAdSZgAuOxTGu7YihFN9pgnZLuQBioQ6h2cFkfNKlMYgSxZChHfArUS9LJMuF9oS65LyUzWZp
	LwDxa4n4mbmiCtfZCziO9XqJxMRuEDlTprUMqB28Qsf8vv6QyMIFZRurnkNycH4VdChYsQ==
X-Google-Smtp-Source: AGHT+IFhJapglddLoAcfVtkFY1ZFqAwKsYf2ZO06E2fuEsfuOqK0vqhtmvAIGCvitYd5fWB/yVSrdQ==
X-Received: by 2002:a05:6a00:4fc3:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-74c99877113mr616846b3a.9.1751479141553;
        Wed, 02 Jul 2025 10:59:01 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:fec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af55c5f38sm15387472b3a.108.2025.07.02.10.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:59:00 -0700 (PDT)
Date: Wed, 02 Jul 2025 10:59:00 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Jul 2025 10:58:58 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.16-rc4
In-Reply-To: <e9eca9db-be56-4ee7-8674-d43c9834b981@ghiti.fr>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-92EEEB3C-6E39-4EE9-9FC2-0BF9DE57AD40@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_105903_405682_DC94C439 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwMiBKdWwgMjAyNSAwNTo0MDowMCBQRFQgKC0wNzAwKSwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZDBiM2I3YjIyZGZh
MWY0YjUxNWZkM2EyOTViM2ZkOTU4ZjllODFhZjoKPgo+ICDCoCBMaW51eCA2LjE2LXJjNCAoMjAy
NS0wNi0yOSAxMzowOTowNCAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Ogo+Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvYWxleGdoaXRpL2xpbnV4LmdpdC8gCj4gdGFncy9yaXNjdi1maXhlcy02LjE2LXJjNAo+
Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDJiMjliZTk2N2FlNDU2ZmMwOWMzMjBk
OTFkNTIyNzhjZjcyMWJlMWU6Cj4KPiAgwqAgcmlzY3Y6IGNwdV9vcHNfc2JpOiBVc2Ugc3RhdGlj
IGFycmF5IGZvciBib290X2RhdGEgKDIwMjUtMDYtMzAgCj4gMDY6NTg6MTEgKzAwMDApCj4KPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gcmlzY3YgZml4ZXMgZm9yIDYuMTYtcmM0Cj4KPiAtIEEgZml4IGZvciBhIHBlcmNw
dSB2YXJpYWJsZSB0aGF0IG1heSBsaWUgaW4gdGhlIHZtYWxsb2MgcmVnaW9uIGFuZCBvbiAKPiB3
aGljaCB3ZSB1c2VkIF9fcGEoKQo+IC0gQSBmaXggdG8gcmVxdWlyZSBhdCBsZWFzdCBjbGFuZy0x
NyB0byBwcmV2ZW50IGJ1aWxkIGlzc3VlcyB3aXRoIAo+IHByZXZpb3VzIHZlcnNpb25zIG9uIGtD
RkkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiBOYXRoYW4gQ2hhbmNlbGxvciAoMSk6Cj4gIMKgwqDCoMKgwqAgcmlz
Y3Y6IFJlcXVpcmUgY2xhbmctMTcgb3IgbmV3ZXIgZm9yIGtDRkkKPgo+IFZpdmlhbiBXYW5nICgx
KToKPiAgwqDCoMKgwqDCoCByaXNjdjogY3B1X29wc19zYmk6IFVzZSBzdGF0aWMgYXJyYXkgZm9y
IGJvb3RfZGF0YQo+Cj4gIMKgYXJjaC9yaXNjdi9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAzICsrLQo+ICDCoGFyY2gvcmlzY3Yva2VybmVsL2NwdV9vcHNfc2JpLmMgfCA2ICsr
Ky0tLQo+ICDCoDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKVGhlc2UgTEdUTSwgdGhleSdyZSBvbiB0aGUgdGVzdGVyIGJ1dCBzaG91bGRuJ3QgdGFrZSB0
b28gbG9uZyAoSSBnb3QgCnRpZWQgdXAgd2l0aCBzb21lIGZhbWlseSBzdHVmZiB0aGlzIG1vcm5p
bmcsIHNvIEknbSBqdXN0IGEgYml0IHNsb3cpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
