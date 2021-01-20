Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164B9C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 09:31:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D0D22D08
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 09:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D0D22D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NN1JNepHY7SnOThPgApxaGTF0wbBwmKo3sPQmw+Ggdc=; b=GRQWJDp1YFCjvaFZwibAvFCLdv
	nv/dJmA1PVnY97Fas1qdfAJdeSLBIBpj0ugmvk3UwZL8i/loprGtQhl8VE5xVx8P/jAxDrGuH2MKa
	P+kAxF2MHKK8K840cmi3XrbhugBu7e6LdaHYakIx0ZUKYQEPfYd+TdiDL+Vg03x/YSV2oV4RzF9u6
	gLjWL9wXOKvLWlAVjunRPiIrD4dGZvsjpKb67rfqR5L2cvLRrRMJn+4WYMwPMZioug0QhC+riPlwX
	59LnrbJpWME9xZasqQwsZcnEZeW/mvtLrJzDrMcPFsyiKDqgQ+LgUYfTH1pQp5w3HSfv2oPRUzWvd
	SKQcCDsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l29pC-0000ut-8M; Wed, 20 Jan 2021 09:30:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l29p7-0000s2-Jg
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 09:30:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id c128so2190394wme.2
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 01:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3Ne/irpWK0pToDck7DyYa8lVDXtVf5cRcYpLpq68u8=;
 b=KuC0tcq83evkt48H1DTelfTBUCctLJY2k5ngkdKKj1kOb9Fr80jIBxyi709606r835
 kOmy9ypLoUQ+GDljAe0My4xiMLrcnsIoqhIFxvTNmg2lWqFzzHttnh6OFCq4AHJ71vSz
 YE5XiV/l9Cd7CdzZJK7n7WDaU/so3lRjzed26NjLLWTN2VR8vsy6eyxQTvcgXFLOvC5d
 R9v8VyUtQfGRDV7uX+2cRx4LnoqMATLvVwu+7v8eLqfT8aStnftOqD0iV+oc0BcpzYiP
 INGUySpv+sm1lu1tjvnwMM2gfi/riSeLtJ0na9guXsJDA5GDgxKrJekjAGS0DgfyVOV7
 BX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3Ne/irpWK0pToDck7DyYa8lVDXtVf5cRcYpLpq68u8=;
 b=IkzlXXRC3u1chZrg2uhub+aF8MnJsxd3vGzmyAdPK8mYHJGNh8OEjb4qaIht3UCl+t
 YKe1E4sl5GwYt42fywoZIlzcW8bq2qsH1w71mAMjNmvUSbCmbQFZIb5jW+tp/k+qW/F4
 GOVsfrv4Ij5fDuhSoy/eXvJiLN/fcKnAhMnSnqa4otohpPv+A7PM4OoljUmfOq4qAlTQ
 c6J6QSDy00NFUrHcYk+nSwE148oDC4rQkv1Pik6svRGTyxNkxauc+rItrdaOuR6AwCqW
 FjHDgAFsIiwwrwyfP6Z4hqrpmDnLawSnyxG8J8DHE+47oJbsQ4xzZAS62P/2vrBrxnBh
 5Oyw==
X-Gm-Message-State: AOAM53387kyzSUmxHG7s3ZEuIj6ughPEDNHY26pO6i70oO2+MfH0hRIy
 qI0RPrLzD+2PFAOZBzKOBvACtQ==
X-Google-Smtp-Source: ABdhPJwkuKGLiilCYOPl4yLZqSrXnQwbxkqU39jDuckh64x0mPe7YxmfrsGB2u5y5xzl0UGCbw8giA==
X-Received: by 2002:a1c:81cc:: with SMTP id c195mr3396693wmd.70.1611135044213; 
 Wed, 20 Jan 2021 01:30:44 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:30:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/20] Rid W=1 warnings from Clock
Date: Wed, 20 Jan 2021 09:30:20 +0000
Message-Id: <20210120093040.1719407-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_043045_662987_2C6A5E25 
X-CRM114-Status: GOOD (  12.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Gallimore <stephen.gallimore@st.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>,
 =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Thomas Abraham <thomas.ab@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Omri Itach <omrii@marvell.com>,
 Maxime Ripard <mripard@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Tero Kristo <kristo@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
 Dinh Nguyen <dinguyen@kernel.org>, Pankaj Dev <pankaj.dev@st.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <Pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhpcyBzZXQgaXMgcGFydCBvZiBhIGxhcmdlciBlZmZvcnQgYXR0ZW1wdGluZyB0byBjbGVhbi11
cCBXPTEKa2VybmVsIGJ1aWxkcywgd2hpY2ggYXJlIGN1cnJlbnRseSBvdmVyd2hlbG1pbmdseSBy
aWRkbGVkIHdpdGgKbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KCldlIHNob3VsZCBoYXZlIHRoZXNl
IG5haWxlZCBpbiB+MiBwYXRjaHNldHMuCgpMZWUgSm9uZXMgKDIwKToKICBjbGs6IHJvY2tjaGlw
OiBjbGs6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlcnMKICBjbGs6IHJv
Y2tjaGlwOiBjbGstY3B1OiBSZW1vdmUgdW51c2VkL3VuZG9jdW1lbnRlZCBzdHJ1Y3QgbWVtYmVy
cwogIGNsazogcm9ja2NoaXA6IGNsay1wbGw6IERlbW90ZSBrZXJuZWwtZG9jIGFidXNlcyB0byBz
dGFuZGFyZCBjb21tZW50CiAgICBibG9ja3MKICBjbGs6IHJvY2tjaGlwOiBjbGstaGFsZi1kaXZp
ZGVyOiBEZW1vdGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYwogICAgaGVhZGVyCiAgY2xrOiBi
Y206IGNsay1pcHJvYy1wbGw6IERlbW90ZSBrZXJuZWwtZG9jIGFidXNlCiAgY2xrOiBzaWZpdmU6
IGZ1NTQwLXByY2k6IERlY2xhcmUgc3RhdGljIGNvbnN0IHZhcmlhYmxlCiAgICAncHJjaV9jbGtf
ZnU1NDAnIHdoZXJlIGl0J3MgdXNlZAogIGNsazogc29jZnBnYTogY2xrLXBsbDogUmVtb3ZlIHVu
dXNlZCB2YXJpYWJsZSAncmMnCiAgY2xrOiBzb2NmcGdhOiBjbGstcGxsLWExMDogUmVtb3ZlIHNl
dCBidXQgdW51c2VkIHZhcmlhYmxlICdyYycKICBjbGs6IG12ZWJ1OiBhcC1jcHUtY2xrOiBEZW1v
dGUgbm9uLWNvbmZvcm1hbnQga2VybmVsLWRvYyBoZWFkZXIKICBjbGs6IGlteDogY2xrLWlteDMx
OiBSZW1vdmUgdW51c2VkIHN0YXRpYyBjb25zdCB0YWJsZSAndWFydF9jbGtzJwogIGNsazogc3Q6
IGNsa2dlbi1wbGw6IERlbW90ZSB1bnBvcHVsYXRlZCBrZXJuZWwtZG9jIGhlYWRlcgogIGNsazog
c3Q6IGNsa2dlbi1mc3luOiBGaXggd29ydGh5IHN0cnVjdCBkb2N1bWVudGF0aW9uIGRlbW90ZSBw
YXJ0aWFsbHkKICAgIGZpbGxlZCBvbmUKICBjbGs6IHRpOiBjbG9ja2RvbWFpbjogRml4IGRlc2Ny
aXB0aW9uIGZvciAnb21hcDJfaW5pdF9jbGtfY2xrZG0ncyBodwogICAgcGFyYW0KICBjbGs6IHN1
bnhpOiBjbGstc3VueGk6IERlbW90ZSBhIGJ1bmNoIG9mIG5vbi1jb25mb3JtYW50IGtlcm5lbC1k
b2MKICAgIGhlYWRlcnMKICBjbGs6IHRpOiBkcGxsOiBGaXggbWlzbmFtaW5nIG9mICdfcmVnaXN0
ZXJfZHBsbCgpJ3MgJ3VzZXInIHBhcmFtZXRlcgogIGNsazogdGk6IGdhdGU6IEZpeCBwb3NzaWJs
ZSBkb2Mtcm90IGluCiAgICAnb21hcDM2eHhfZ2F0ZV9jbGtfZW5hYmxlX3dpdGhfaHNkaXZfcmVz
dG9yZScKICBjbGs6IHN1bnhpOiBjbGstYTEwLXZlOiBEZW1vdGUgb2J2aW91cyBrZXJuZWwtZG9j
IGFidXNlCiAgY2xrOiBzdW54aTogY2xrLW1vZDA6IERlbW90ZSBub24tY29uZm9ybWFudCBrZXJu
ZWwtZG9jIGhlYWRlcgogIGNsazogdmVyc2F0aWxlOiBjbGstaWNzdDogRml4IHdvcnRoeSBzdHJ1
Y3QgZG9jdW1lbnRhdGlvbiBibG9jawogIGNsazogenlucTogY2xrYzogUmVtb3ZlIHZhcmlvdXMg
aW5zdGFuY2VzIG9mIGFuIHVudXNlZCB2YXJpYWJsZSAnY2xrJwoKIGRyaXZlcnMvY2xrL2JjbS9j
bGstaXByb2MtcGxsLmMgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2Nsay9pbXgvY2xrLWlteDMx
LmMgICAgICAgICAgICAgfCAxMCAtLS0tCiBkcml2ZXJzL2Nsay9tdmVidS9hcC1jcHUtY2xrLmMg
ICAgICAgICAgfCAgMiArLQogZHJpdmVycy9jbGsvcm9ja2NoaXAvY2xrLWNwdS5jICAgICAgICAg
IHwgIDQgLS0KIGRyaXZlcnMvY2xrL3JvY2tjaGlwL2Nsay1oYWxmLWRpdmlkZXIuYyB8ICAyICst
CiBkcml2ZXJzL2Nsay9yb2NrY2hpcC9jbGstcGxsLmMgICAgICAgICAgfCAgNiArLQogZHJpdmVy
cy9jbGsvcm9ja2NoaXAvY2xrLmMgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvY2xrL3Np
Zml2ZS9mdTU0MC1wcmNpLmggICAgICAgICB8ICA1IC0tCiBkcml2ZXJzL2Nsay9zaWZpdmUvc2lm
aXZlLXByY2kuYyAgICAgICAgfCAgNSArKwogZHJpdmVycy9jbGsvc29jZnBnYS9jbGstcGxsLWEx
MC5jICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvY2xrL3NvY2ZwZ2EvY2xrLXBsbC5jICAgICAgICAg
ICB8ICAzICstCiBkcml2ZXJzL2Nsay9zdC9jbGtnZW4tZnN5bi5jICAgICAgICAgICAgfCAgNiAr
LQogZHJpdmVycy9jbGsvc3QvY2xrZ2VuLXBsbC5jICAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZl
cnMvY2xrL3N1bnhpL2Nsay1hMTAtdmUuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2Nsay9z
dW54aS9jbGstbW9kMC5jICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9jbGsvc3VueGkvY2xr
LXN1bnhpLmMgICAgICAgICAgIHwgMzIgKysrKystLS0tLS0KIGRyaXZlcnMvY2xrL3RpL2Nsb2Nr
ZG9tYWluLmMgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2Nsay90aS9kcGxsLmMgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9jbGsvdGkvZ2F0ZS5jICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvY2xrL3ZlcnNhdGlsZS9jbGstaWNzdC5jICAgICAgICB8ICA3
ICsrLQogZHJpdmVycy9jbGsvenlucS9jbGtjLmMgICAgICAgICAgICAgICAgIHwgNzMgKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLQogMjEgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwg
OTggZGVsZXRpb25zKC0pCgpDYzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KQ2M6IGJj
bS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNvbS5jb20KQ2M6IENoZW4tWXUgVHNhaSA8d2Vu
c0Bjc2llLm9yZz4KQ2M6IERpbmggTmd1eWVuIDxkaW5ndXllbkBrZXJuZWwub3JnPgpDYzogIkVt
aWxpbyBMw7NwZXoiIDxlbWlsaW9AZWxvcGV6LmNvbS5hcj4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4KQ2M6IEdyZWdvcnkgQ2xlbWVudCA8Z3JlZ29yeS5jbGVtZW50QGJv
b3RsaW4uY29tPgpDYzogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IEplcm5l
aiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KQ2M6IEp1bGlhIExhd2FsbCA8SnVs
aWEuTGF3YWxsQGlucmlhLmZyPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+
CkNjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CkNjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCkNjOiBsaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8
bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+CkNjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4
aWxpbnguY29tPgpDYzogTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPgpDYzogT21y
aSBJdGFjaCA8b21yaWlAbWFydmVsbC5jb20+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPgpDYzogUGFua2FqIERldiA8cGFua2FqLmRldkBzdC5jb20+CkNjOiBQYXVsIFdh
bG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNjOiBQZW5ndXRyb25peCBLZXJuZWwg
VGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4KQ2M6IFByYWduZXNoIFBhdGVsIDxQcmFnbmVzaC5wYXRlbEBzaWZpdmUu
Y29tPgpDYzogUmF5IEp1aSA8cmp1aUBicm9hZGNvbS5jb20+CkNjOiBTYXNjaGEgSGF1ZXIgPHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU+CkNjOiBTY290dCBCcmFuZGVuIDxzYnJhbmRlbkBicm9hZGNv
bS5jb20+CkNjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+CkNjOiAiU8O2cmVuIEJy
aW5rbWFubiIgPHNvcmVuLmJyaW5rbWFubkB4aWxpbnguY29tPgpDYzogU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPgpDYzogU3RlcGhlbiBHYWxsaW1vcmUgPHN0ZXBoZW4uZ2FsbGltb3Jl
QHN0LmNvbT4KQ2M6IFRlcm8gS3Jpc3RvIDxrcmlzdG9Aa2VybmVsLm9yZz4KQ2M6IFRob21hcyBB
YnJhaGFtIDx0aG9tYXMuYWJAc2Ftc3VuZy5jb20+CkNjOiBYaW5nIFpoZW5nIDx6aGVuZ3hpbmdA
cm9jay1jaGlwcy5jb20+CkNjOiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Ci0tIAoyLjI1
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
