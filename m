Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF502C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 20:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=egYSf15FzINtRX9RX5Lu2wVPxt7+8t9FrPK/4dSKwl8=; b=SzpE+lL9OrlBw9
	JwDc8f5E7/YqtVcj1Aj4XB/RJ6Zt53Ez35my34M+ot+yYUVmgp2T9qVO/YFxiX4i9KQVsfSonj0H4
	NO+iwVJdqYwUHY9XlSzrI9tqIKCxG4xjXUQmC7VJWe+t9dY4t7EdMyYwtqQN6raZLg2dF/Rk2xlJy
	6VK/nZjVN6znVfJ67l51Uiml0CYHMPhSq0daMHeZJkrA0kDAgh7trfro3zongLxLJ52SBoqQrZFSv
	SeFp+px4pgrDOIcRG1g9yc3PWtwtGeHDsukPTNGwUTSitOEy+StRgp2C/sfyBG0/PopxzAvhdo7bU
	XnTBoq6s4piGsUpVbF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTvx-00000009hjM-28Wj;
	Tue, 18 Feb 2025 20:11:09 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIh-00000009a06-00Ed
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:37 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e05717755bso3947653a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 11:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907033; x=1740511833; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIW3Tj0XdfJSfKxjiYcsy2cS5srx8ZXffTdS0QjWZns=;
        b=gMBk2uU98Mhyk4MYJXQvDTlgO431bhH99LvAoXG4tnDKLou7jw7GA2sRLmdkL16KF9
         kz1y691wjtm1lRbFzsXqeii5h4onOxhv65shSoG9dfO+PvAvqrpJqWOF+uwk92cFPkiy
         t80Byj/A8/USxUot5+QHba3H/jmPIegQ9DqP/QM2GMkP7hcKSy3KNn/HSbIzIrPKvllj
         1EnK/1kWIaqVMi4K3zqUfqO6/KJE64NxPCnxC4SQYIuPaRh26+0EIM9G0eJx0dbCebe4
         uD7mGasylRTJsOsk+R2SqnpRRzs4EGcC+80KcxA8BjR0lZ8JLHz5NVtS9cfpwO7PlsMG
         cXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907033; x=1740511833;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIW3Tj0XdfJSfKxjiYcsy2cS5srx8ZXffTdS0QjWZns=;
        b=CvWEA+FlZ+nI2Zkt9DhXRtdnMXARJM0HOinoRjxW06YKn1LEga/PQ9YDijt3ElXu5N
         qMZNrRGFU37bs0Kb60gGUtZ4V6H1WTB1Xnp8/HgFtQofmCtVpMYq3a+vCxW9KZm0sf++
         6XwSuYoDDjXvokvv2SSoD671645coPraI+hxBzC8jWxbUpDputFCc8p372ZuGCuk2qCc
         ZqqbFVBWQQBCjkKlI+muEMdV5sS8RfBtktxzJBgRPtZv2v+/R4B9eJRLYqu+2piN1WY3
         T/mbsyi6Teanp2M+Okca1ZrUHXvsa7Go4IodA+J2bajqDGwtVZLvFRDOqB8l/mMsYEGR
         1w9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrfy2lIFrX4oPK/c72A3TkYKASvm7SCx1OyvboGxDlry3xsDxO0WKOYBFPKJi4y+st2Q1xUZgZ+UquUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXz2gKWSBElUqxWStLXkg5qfb0dXvIdC9agjKrhmjpCJL2TNRt
	290l6sYGQsVA2vb9xAC6Z92655oGNpktmtwYNV6sYRMpoPYo7VU/IPWjMdcS+e0=
X-Gm-Gg: ASbGnctPditVOFIyNxBMlT2DYrfqUOCtP0pzs5uVKcgjzUlnr8heZfhWR1MkAH109Zx
	MUp3d6I1az0Xt/eVBVfWYkmlrs+ZIM9Xy84iAgGGAnYxpmGSWeUNWO9yMD7Rp+qAzMyl/SRnu6S
	/7VQE4qrY4t+z7s+ps9aA6JuBlPhf6UHSkPO7gJRoABDBQnTDMmorJsfPGZm4ru4HsABVLZ7QJJ
	wh4K5yrLVzArhyRdDRIozat/0Mx+YIGF6tNyk7X+VzNnc5CX6wpLNBxQwsBXmeEpdHL9J6tjNc+
	GLsY1Wjmtukkr1ApEWpZ0BqCivLC
X-Google-Smtp-Source: AGHT+IEsUkQkmLnMxncHVAOTmPsKmvVPSTaQR78ji9vJrVN7d833EMl3VWJfxC45bU7tBdks7OZrJg==
X-Received: by 2002:a05:6402:51d4:b0:5e0:51a9:d410 with SMTP id 4fb4d7f45d1cf-5e051a9d59cmr11065896a12.25.1739907032830;
        Tue, 18 Feb 2025 11:30:32 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/8] driver core: auxiliary bus: add device creation
 helper
Date: Tue, 18 Feb 2025 20:29:45 +0100
Message-Id: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKnftGcC/42NQQ6CMBBFr0Jm7RimLbG48h6GRSmDNEEgUyQQw
 t2tnMDl+/n//R0iS+AI92wH4SXEMA4JzCUD37nhxRiaxKByZUhRju6zYpOKntELu5mx435iwVK
 ToUIZLpSGNJ+E27Ce6meVuAtxHmU7nxb6pX9IF0LCwtpbaxpb6tw+arf1oRa++vEN1XEcXzgI+
 /LDAAAA
X-Change-ID: 20241210-aux-device-create-helper-93141524e523
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3639; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5jr0njrsEqh+gx0/hryuSdGRgOG6j3FS8QheXHGTwG0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/OWNreQDN/vUjV7hrjtf9acN+LfunziKrQQ
 0+55m0edLGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7TfzgAKCRDm/A8cN/La
 hRMsD/9ziamapLyta7b2bnUpuc3WwKbKpFZ9GL/J7nw2y3cw/h5jQBYbDSF9JrRSKgzBbfv6Sey
 QRNn8YHjpUuiMQoo8wdF8JQAlfzz2s0Us6Or+rdpDD/QESOXyHDqj4MUG6FTXYd6FP3XToJ42vi
 o298p/RQJt7nZk755yQCNu+oz2gqK2ZaQnsfxtwRPjODRR7EFCDtt6GzOIQ6gMys62o6Mk/PRs+
 l1rKan/fK30ltLDStso25MaxLWBWV+npLFI35BMTlhMEwG+JTun3VMmjlWz9kiBjMqGBx2qiste
 CCASomjcV/H2nDkNLAKwD/UefscVOHz9VIb3RNV4bBZIaCNqPYvjtZw8poWesaxupOoNpkApV1I
 iuOjXT0pkOdE3AtkaBQ/6cVd15in+oW9zqTzplE86661VuagqxrOQ+l8pbmbmk0R89TtIXS6KLO
 hLZG6xJCG94i6UMTAU0hCmZlQU/CW22okUfGUHjgTYK6ptzPX+PDffsa4fBWg7IHfxtdZ2bKtln
 RgJlvATKPKlyz7ds7JlS5NJM9MAPT8rPBlDL08q9TxYGO1jW1mxv3I14XfLQ7XXv+yTGVoSNwA0
 XUgHQc8fDO8z2hMMyQDJqxbCfvG5BaZ42qT2FGwEEHgMmmQe7i0RN0x7Le1Ppt/hMQ35Cpsysif
 vfaUCrYJTwsPKFQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113035_122186_E1263A2A 
X-CRM114-Status: GOOD (  15.67  )
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

VGhlIHN1Z2dlc3Rpb24gZm9yIHRoaXMgY2hhbmdlIHdhcyBpbml0aWFsbHkgZGlzY3Vzc2VkIGhl
cmU6IFsxXQoKVGhpcyBwYXRjaHNldCBhZGRzIGFuZCB1c2UgYSBoZWxwZXIgdG8gY3JlYXRlIGEg
c2ltcGxlIGF1eGlsaWFyeSBkZXZpY2UuClRoZSBnb2FsIGlzIHRvIHJlbW92ZSBib2lsZXJwbGF0
ZSBjb2RlIHRoYXQgdGVuZHMgdG8gZ2V0IHJlcGVhdGVkIGZvcgpzaW1wbGUgY2FzZXMuCgpPbmx5
IHRoZSBsYXN0IGNoYW5nZSB3YXMgdGVzdGVkIG9uIGFjdHVhbCBIVy4gVGhlIG90aGVyIHVzYWdl
IG9mIHRoZSBoZWxwZXIKaGF2ZSBvbmx5IGJlZW4gY29tcGlsZSB0ZXN0ZWQgd2l0aCB4NjRfNjQg
YWxsbW9kY29uZmlnLiBUaGVyZSBhcmUgbWFueSBvdGhlcgpzaW1wbGUgY2FzZXMgb2YgYXV4aWxp
YXJ5IGRldmljZSBjcmVhdGlvbiBidXQgdGhvc2UgdGVuZCB0byB1c2UgdGhlCidjb250YWluZXJf
b2YnIHRyaWNrIHRvIGFsbG9jYXRlIHRoZSBhdXhpbGlhcnkgZGV2aWNlLiBJdCBpcyBwb3NzaWJs
ZSB0bwpjb252ZXJ0IHRoZXNlIGRyaXZlcnMgdG8gdXNlIHRoZSBwcm92aWRlZCBoZWxwZXIgYnV0
IHRoZSBjb252ZXJzaW9uIGlzCnNsaWdodGx5IG1vcmUgY29tcGxleC4KCk5PVEU6IFRoaXMgc2Vy
aWVzIGlzIGJhc2VkIG9uIC1yYzEuIE9ubHkgdGhlIGZpcnN0IGNoYW5nZSBpcyBtZWFudCB0bwph
cHBsaWVkLiBUaGUgcmVzZXQgd2lsbCBsaWtlbHkgd2FpdCBmb3IgdGhlIGhlbHBlciB0byBsYW5k
IGluIG1haW5saW5lLgpSZWJhc2Ugb24gdGhlIGNvcnJlc3BvbmRpbmcgc3Vic3lzdGVtIHdpbGwg
YmUgZG9uZSB3aGVuL2lmIG5lY2Vzc2FyeS4KClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtY2xrL2RmMGE1M2VlODU5ZTQ1MGQ4NGU4MTU0NzA5OWY1ZjM2LnNib3lkQGtlcm5lbC5v
cmcKCkNoYW5nZXMgaW4gdjQ6Ci0gQWRkZWQgZXllcSByZXNldCBwYXRjaCBmcm9tIFRoZW8gKFRo
YW5rcykKLSBDaGFuZ2VkIHJldHVybmVkIHZhbHVlIHRvICd2YWxpZCBvciBOVUxMJy4gQ29uc3Vt
ZXJzIHNob3VsZCByZXR1cm4KICAtRU5PREVWIGlmIHRyYW5zbGF0aW9uIHRvIGludCBpcyBuZWNl
c3NhcnkuCi0gRXhwb3J0IHRoZSBub24tbWFuYWdlZCBmdW5jdGlvbiBoZWxwZXJzCi0gRGVmYXVs
dCBpZCB0byAwIGZvciB0aGUgc2ltcGxlciBkZXZtX2F1eGlsaWFyeV9kZXZpY2VfY3JlYXRlKCkg
YXMKICBzdWdnZXN0ZWQgYnkgQ29ub3IKLSBGaXggY2xrLWlteDhtcC1hdWRpb21peCBjb25maWcg
cHJvYmxlbSByZXBvcnRlZCBieSBJcmEKLSBSZWJhc2VkIG9uIGRybS1uZXh0IGZvciB0aS1zbjY1
ZHNpODYKLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMjExLWF1
eC1kZXZpY2UtY3JlYXRlLWhlbHBlci12My0wLTdlZGI1MDUyNDkwOUBiYXlsaWJyZS5jb20KCkNo
YW5nZXMgaW4gdjM6Ci0gSW1wbGVtZW50IElyYSdzIHN1Z2dlc3Rpb24gdG8gdXNlIEtCVUlMRF9N
T0ROQU1FIGJ5IGRlZmF1bHQsIHNhbWUgYXMKICBhdXhpbGlhcnlfZHJpdmVyX3JlZ2lzdGVyKCkK
LSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMjA2LWF1eC1kZXZp
Y2UtY3JlYXRlLWhlbHBlci12Mi0wLWZhNmEwZjMyNjUyN0BiYXlsaWJyZS5jb20KCkNoYW5nZXMg
aW4gdjI6Ci0gQWRkIHVzYWdlIGV4YW1wbGVzLCBhcyByZXF1ZXN0ZWQuCi0gQWRkICdpZCcgYXMg
ZnVuY3Rpb24gcGFyYW1ldGVyOiAgQWRkaW5nIHRoZSBleGFtcGxlIHVzYWdlIHNob3dlZCB0aGF0
CiAgaGFuZGxpbmcgSURBIGFsbG9jYXRpb24gd2FzIG5vdCBhcHByb3ByaWF0ZSBhbmQgbWFraW5n
IHRoZSB1c2FnZSBtb3JlCiAgY29tcGxleCBmb3Igc2ltcGxlIHVzZSBjYXNlLgotIEFsc28gYWRk
ICdtb2RuYW1lJyBhcyBwYXJhbWV0ZXI6IE1vc3QgZHJpdmVyIGhhdmUgYmVlbiB1c2luZwogIEtC
VUlMRF9NT0ROQU1FIGFuZCB0aGlzIGFjdHVhbGx5IHJhcmVseSBhbGlnbiB3aXRoIHRoZSBkcml2
ZXIgbmFtZS4KLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjEw
LWF1eC1kZXZpY2UtY3JlYXRlLWhlbHBlci12MS0xLTU4ODdmNGQ4OTMwOEBiYXlsaWJyZS5jb20K
ClNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgotLS0K
SmVyb21lIEJydW5ldCAoNyk6CiAgICAgIGRyaXZlciBjb3JlOiBhdXhpbGlhcnkgYnVzOiBhZGQg
ZGV2aWNlIGNyZWF0aW9uIGhlbHBlcnMKICAgICAgcmVzZXQ6IG1wZnM6IHVzZSB0aGUgYXV4aWxp
YXJ5IGRldmljZSBjcmVhdGlvbgogICAgICBkcm0vYnJpZGdlOiB0aS1zbjY1ZHNpODY6IHVzZSB0
aGUgYXV4aWxpYXJ5IGRldmljZQogICAgICBwbGF0Zm9ybTogYXJtNjQ6IGxlbm92by15b2dhLWM2
MzA6IHVzZSB0aGUgYXV4aWxpYXJ5IGRldmljZSBjcmVhdGlvbiBoZWxwZXIKICAgICAgY2xrOiBl
eWVxOiB1c2UgdGhlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyCiAgICAgIGNsazog
Y2xrLWlteDhtcC1hdWRpb21peDogdXNlIHRoZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0aW9uIGhl
bHBlcgogICAgICBjbGs6IGFtbG9naWM6IGF4Zy1hdWRpbzogdXNlIHRoZSBhdXhpbGlhcnkgcmVz
ZXQgZHJpdmVyIC0gdGFrZSAyCgpUaMOpbyBMZWJydW4gKDEpOgogICAgICByZXNldDogZXllcTog
ZHJvcCBkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYoKSBkb25lIGJ5IHBhcmVudAoKIGRyaXZl
cnMvYmFzZS9hdXhpbGlhcnkuYyAgICAgICAgICAgICAgICAgIHwgMTA4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvY2xrL2Nsay1leWVxLmMgICAgICAgICAgICAgICAgICAg
IHwgIDU3ICsrKystLS0tLS0tLS0tLQogZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4bXAtYXVkaW9t
aXguYyAgICAgfCAgNDkgKysrLS0tLS0tLS0tLQogZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZyAg
ICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvY2xrL21lc29uL2F4Zy1hdWRpby5jICAg
ICAgICAgICAgIHwgMTE0ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyAgICAgfCAgNDkgKystLS0tLS0tLS0tLQogZHJp
dmVycy9wbGF0Zm9ybS9hcm02NC9sZW5vdm8teW9nYS1jNjMwLmMgfCAgNDAgKy0tLS0tLS0tLS0K
IGRyaXZlcnMvcmVzZXQvcmVzZXQtZXllcS5jICAgICAgICAgICAgICAgIHwgIDEzICstLS0KIGRy
aXZlcnMvcmVzZXQvcmVzZXQtbXBmcy5jICAgICAgICAgICAgICAgIHwgIDU2ICsrLS0tLS0tLS0t
LS0tLQogaW5jbHVkZS9saW51eC9hdXhpbGlhcnlfYnVzLmggICAgICAgICAgICAgfCAgMTcgKysr
KysKIDEwIGZpbGVzIGNoYW5nZWQsIDE3NiBpbnNlcnRpb25zKCspLCAzMjkgZGVsZXRpb25zKC0p
Ci0tLQpiYXNlLWNvbW1pdDogMGVkMTM1NmFmOGY2MjlhZTgwNzk2M2I3ZGI0ZTUwMWUzYjU4MGJj
MgpjaGFuZ2UtaWQ6IDIwMjQxMjEwLWF1eC1kZXZpY2UtY3JlYXRlLWhlbHBlci05MzE0MTUyNGU1
MjMKCkJlc3QgcmVnYXJkcywKLS0gCkplcm9tZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
