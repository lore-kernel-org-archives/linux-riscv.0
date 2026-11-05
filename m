Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A93606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6NmjfrO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sj48FKi9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h/ijrlSt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cPfhJmk+vLqOe9nkoAp1rg0JHNTENHCqLpLhmCobrao=; b=K6NmjfrOpSZMYs01C1WH9qJ45S
	vzmC80IWunOYKruRMDpIht9f2o2iKD2KD7CYOwz6Q74n+9EN3xudHXmMq+2tOXBgePkH7qA36S4nh
	hT+rEYqv/tv8yMFF/m+mQfw4LCs2zV4MhHBnBny9u+JBXCAS2+IAIlur9h+SsNY1RNxxzViZXVi+D
	W9tqRTeFvJd2eBoDsPo/U6xVCt/f9Q0z5H81KL6v22aJFuoMTJpLatBYb7xalJNqPuyzWeoW9Kiwr
	W+GPEuOe4Gwf1tb5a7L+Ig9D86lSBOrT6cVI/eePkehO3uox9CzyCCohs5tiAFfCQTdkH9X8Fxca4
	gcTGOZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwWW-00000008w8d-3njL;
	Thu, 05 Nov 2026 12:24:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwWT-00000008w5y-3fUN
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 12:24:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tLTi444561
	for <linux-riscv@lists.infradead.org>; Thu, 5 Nov 2026 12:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=; b=Sj48FKi9APQlwcOq
	GDAZNmLT3CXSYY9O+PaU3TtvVQysmkBy1nFGyuUMO4SfoWoJlZtUpXCJkjnuYpzY
	XhLBH0rApGtho+uA+IAj5i07YLstmB9uL4i1XBq2Fn4pAjyqtB4XhAj1DTYr86gX
	5h0QIcNnJeXfVZBVW2XVKnFiBhtzA0BEg55NXJZTELlnDMVuiU85I18Gm8uTrsjx
	Bm4Xmm9nnEkThsG1fvHwBfQqWaknlaKGAGhtveTyrF84F1glilfOAmggfSRVvvEd
	rbtpKEm24aw9iEU5HrfbsTHWAsez6HxgkStnDOX7IuVgh3p0wZQ2I3uPsLJI53R4
	TL6jqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaagy6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 12:24:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so559587985a.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793881492; x=1794486292; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
        b=h/ijrlStmIkUAMcePYd+yIGCOq/UWJFlhtqO8KC6kLCmp5ZNvg6YNNIZO0M+Eyngx6
         CqN/MaKrwDAp+UnjSZ3KW9FN6vjnxF6rfNxSjlTuDVKyO1zhtVi1H7leJbGNKn17kyX+
         G5Urm3Q57FfCdvI010KfuoD/A/1Ytuq/eM5eebgTvjiJ9h3xvdqJRQZ8zYJFYBozCVl/
         VHK48Ae1zfcon2g220U9FoRm6RLb6PIZsnFM09jk/nUcyVroN43Fgo3PuuHP1BFtfU06
         fXx1sz/GSIvX1UAsToVh4qidpjN53GwP0od2G81CLQJhBESUweLUOtWdSu6PSdMfOASP
         fd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881492; x=1794486292;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=662NwdLNBtUdGCmzgsMnPMmCnx3lvo2FazCLn8DNyc4=;
        b=QWy+9nC0Gt45oJ09aqZFc0js9x3ESL8pR2DuoWnSXDSvdPZnnU4SmZ/TQrZXY4p/9R
         xsXcLlSBO3aHTEpJMQc9ssuPTNtCddiQebSAZhOBMy5gHY0FQZlXDR7EX7wnlrYZewEd
         XYtIpqtcO89j3o5N4ByYuhbgHk7Do9Q7rVReLc0UwbDM1ms00QcKK4qMIWY++yi2C3XR
         IY/Wszfw8qJ5j+ruWDKzWZaolGtCpN46lPSDQ6RaLAqqJzYC2x9dLti/imE9QUKJKHZx
         eXmBQ5kZVBY/sgCUOWMH3qVnoR6I1mEHmTpBjbGmhimNqL3/kRlBmJWv9mUHzWbZr8sG
         ELsg==
X-Forwarded-Encrypted: i=1; AKwUvBz4cpRdqkODWtvFG31HQ8TT8BJYUCe4UaFYy4ZkEwMAzZYQesb2d2iSF4VED1ImPiCZCLJujMyeR3ZjiA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9i1Q38ktP2PkW+E5CEM9a9hm6x/m+4tafN7KXrxF1/sNZmwzOE
	Jf9dVljvOp9yp/xZS+Vrh1dBcIqyITaCNJzCqkAudM/eYtvQTx/x9JBakNv9eDMlEN3huPF0fkT
	xAsHMoSw70vGyPudDHYc7FzGaFAuUWooo6Vojq4j8cGX9bApNVnCqyVaTA2eVYEOM2zKEWyU=
X-Gm-Gg: AYBFou0kglYUWEyYw1zZoAaXVbdntEcoh52H+aaCBdKbWPzq3E7WTi1ll4VpakPFsAU
	Aa19rGFelgj3kJaH31PgIT9Tgu8OepgsPhZlecja+6mIPCc3x0UnEsJgKcMovo3d71UQBwRvhwI
	2idWTf3lhdxHwFAovZA/0lKc1sON29FE87xwlPN8JSsKNFMoKMJxnJBRip0QGvFUDUxGcLKNZDc
	EHTPQzDqZV8NKSeeSh6asLHI+0vX30WrYHrBgMlz6xNwekldvFcILUW5QfL7MI2j+LelW3NbGXv
	bFBEGo8C2wVyDj4hjtTo8LD/bDpKydp4ad7w0GzLXB0qxzMor2ctyRwHkzgYXLvnqzgpn9eerEI
	B6dlO2FSey04esHROeUgrHVqlZV9T/hhkVJwa9C3PkHS5ETrliD+CEZwtJGWXUrxCYFw2X29tuv
	vX
X-Received: by 2002:a05:620a:1a0e:b0:93f:2ab9:72a0 with SMTP id af79cd13be357-9442172e3a8mr3096711285a.70.1793881492109;
        Thu, 05 Nov 2026 04:24:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a0e:b0:93f:2ab9:72a0 with SMTP id af79cd13be357-9442172e3a8mr3096707785a.70.1793881491600;
        Thu, 05 Nov 2026 04:24:51 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm61320965e9.8.2026.11.05.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:24:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
        Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        linux-hwmon@vger.kernel.org,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, Michael Buesch <m@bues.ch>,
        William Breathitt Gray <wbg@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
Date: Thu,  5 Nov 2026 13:24:47 +0100
Message-ID: <179388146665.22103.2916811858448928630.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfX6IEyjLL+pMIQ
 NsjitKba55CaqGnsFonxZ5KWzk1ktLJlw2XJi9/0M32Yfw3Lv0S7jBLGcKA0BrNZ9TuNtAPPVPj
 LemiOw5SryGihhsvj5DBKV/vUh8Ij/4uyoIgTs1x+SYrDrxn4INU3ZokmM1FfKDrvsYzoZv9Vy2
 zCIoUK7+dAWZA+za8DX7nWqqQtbK6JHYykhT1R+LY0lL2uxRYMrJsNl1somqjghorhJBSk5jcIB
 pnd0d5QaScEYItRaVt6epvYEyWvrZ/zaIKpjGClDdN1cClri4dILqBD8mDrQhL+hrFtX9QiJuv4
 E9OS613tttD2sS3zRNaHhW/gMqemdT8ULojqowBt1h5MoGAAorXd+xKVLHT+TIN1rimH9miCV8s
 2qLKJ8ZxbIwfRSW2nYFUv8xMPeNKgiEGB2bFN3LrSm7G344U8J3NSTqa9yybiJFGLZYUnrPe/Fw
 MA7K5yvj5LUkL9QaQkA==
X-Proofpoint-GUID: fBvCg8kH3jOS5ya71OwpmMABonm1gqCP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfX3YruI84vbKIq
 XiplZ8OGLu5kf/HkaWNGCR34mdqpupT2h93lVP+mmSIhl19J7XqdUJ06wfR5yn7YOF3bb1BTZjM
 AFoLceUHsl5ZGJAJwJu4WfmQ61KRnpI=
X-Proofpoint-ORIG-GUID: fBvCg8kH3jOS5ya71OwpmMABonm1gqCP
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec7594 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=k4E0auTuH4aaYxdkK-0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_042454_057087_9B53FEA1 
X-CRM114-Status: GOOD (  12.92  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ck9uIFR1ZSwgMjcgT2N0IDIwMjYgMTE6NDg6MzcgKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIChU
aGUgQ2FwYWJsZSBIdWIpIHdyb3RlOgo+IHRoZSBvcmlnaW5hbCBtb3RpdmF0aW9uIGZvciB0aGlz
IHNlcmllcyBhcmUgdGhlIHBhdGNoZXMgdGhhdCBjb252ZXJ0IHRoZQo+IGFycmF5cyB0byB1c2Ug
bmFtZWQgaW5pdGlhbGl6ZXJzLCBzZWUKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292
ZXIuMTc4MDA0ODkyNS5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KPiBmb3IgdGhl
IGlkZWEgYmVoaW5kIGl0LiBMb29raW5nIGxlZnQgYW5kIHJpZ2h0IGEgYml0IHdoaWxlIGltcGxl
bWVudGluZwo+IHRoYXQsIHRoZSBzZXJpZXMgZ3JldyBhIGJpdC4KPiAKPiBDaGFuZ2VzIHNpbmNl
IHYzIChhdmFpbGFibGUgYXQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc5
MzAzMDgyMC5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbSk6Cj4gCj4gWy4uLl0KCkFw
cGxpZWQsIHRoYW5rcyEKClswMS8yM10gZ3BpbzogUmVtb3ZlIF9fbWF5YmVfdW51c2VkIGFubm90
YXRpb25zIGZyb20gYWNwaV9kZXZpY2VfaWQgYXJyYXlzCiAgICAgICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9icmdsL2MvYzU2M2Y5YTdlYmRiOGRlMzYwNDJiNjg1Yzg5YjI5YTU2YmI0YTJkOApb
MDIvMjNdIGdwaW86IGZ4bDY0MDg6IFJlbW92ZSBfX21heWJlX3VudXNlZCBhbm5vdGF0aW9ucyBm
cm9tIG9mX2RldmljZV9pZCBhcnJheQogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnJn
bC9jLzlhZTIzMWFjMDQwY2JkZDllMjRkZGE4YTc2ZTViMGE1MjE5NWZjYTMKWzAzLzIzXSBncGlv
OiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIGFjcGlfZGV2aWNlX2lkIGRyaXZlciBkYXRhCiAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icmdsL2MvN2EyZGFjNmRlMDU0ZGEzNTlhMGY5
ODZkYzliOGZlN2ExYzJhOTdlNApbMDQvMjNdIGdwaW86IG1heDczMDE6IERyb3AgdW51c2VkIGFz
c2lnbm1lbnQgb2Ygc3BpX2RldmljZV9pZCBkcml2ZXIgZGF0YQogICAgICAgIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvYnJnbC9jLzlkNmYyMWE4MTU0ZWJjZjc3N2Q5ODM2ZjJjODA0ZjY1YzQxNzNi
MDIKWzA1LzIzXSBncGlvOiBtbWlvOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIHBsYXRmb3Jt
X2RldmljZV9pZCBkcml2ZXIgZGF0YQogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnJn
bC9jLzlkMTRlMjQ2MzkxZjBjYWFmY2ZmYTdmZTUyMTFiMzJkMjQ2ZmIzMjcKWzA2LzIzXSBncGlv
OiBsamNhOiBEcm9wIHVudXNlZCBhc3NpZ25tZW50IG9mIGF1eGlsaWFyeV9kZXZpY2VfaWQgZHJp
dmVyIGRhdGEKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JyZ2wvYy81MjZmZDVhMjk5
ZGE0ZTk1NGE2NjEyNDQ2NGZjMjcyYjlkNmVjNTI5ClswNy8yM10gZ3BpbzogeGdlbmU6IEFkZCBt
aXNzaW5nIEFDUEkgbW9kdWxlIGFubm90YXRpb24KICAgICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL2JyZ2wvYy9jN2I0ZjhlYTU3MjUzNjNiYjcyMDliZTI2Y2Q1NzQyOGU1MzRlYjRjClswOC8y
M10gZ3Bpbzogc29kYXZpbGxlOiBBZGQgbWlzc2luZyBQQ0kgbW9kdWxlIGFubm90YXRpb25zCiAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icmdsL2MvNzdlMzg3MTUzZTJhODcxZDFiZDg0
ZmExNzBkMWUwYzJiYTJjZjc4ZApbMDkvMjNdIGdwaW86IEFkZCBtaXNzaW5nIE9GIG1vZHVsZSBh
bm5vdGF0aW9ucwogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnJnbC9jLzkzZmY5ZDNi
ZWIyYTIwYzdjYzVhNWQ2MGU4MWRlOGJhOGU3NzAzMzgKWzEwLzIzXSBncGlvOiBweGE6IEFkZCBt
aXNzaW5nIHBsYXRmb3JtIG1vZHVsZSBhbm5vdGF0aW9ucwogICAgICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvYnJnbC9jLzFhOTNiODA2MDc4MGJjNTBiOTM0OGQyODIyNDk4NmEzNTUyZjVkODcK
WzExLzIzXSBncGlvOiBwbDA2MTogVXNlIGVtcHR5IGluaXRpYWxpemVyIGZvciBhbWJhX2lkIHRl
cm1pbmF0b3IKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JyZ2wvYy81MDFhMDM3NmE1
ODJhYmVlODI1ZDI1ZmJhNDJhYjZmOWY4MDQzM2JlClsxMi8yM10gZ3BpbzogVXNlIG5hbWVkIGlu
aXRpYWxpemVycyBmb3IgYWNwaV9kZXZpY2VfaWQgYXJyYXkKICAgICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL2JyZ2wvYy85MWY3ZTdmYjEwNTkyODUwYTdkOTA3NWUxNmFlZTVmYmU4M2YxZTlh
ClsxMy8yM10gZ3BpbzogVXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3IgYXV4aWxpYXJ5X2Rldmlj
ZV9pZCBhcnJheXMKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JyZ2wvYy9iM2VmNmJm
ZDBlMTQ0NTBkZWJmNzI4MjI1ODk0YjcwYTMzNzlmNTE0ClsxNC8yM10gZ3BpbzogcGNmODU3eDog
VXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3Igb2ZfZGV2aWNlX2lkIGFycmF5CiAgICAgICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9icmdsL2MvNWIyZGNkNjFjMjEwNWY1YjE3NTkxYzNjNDRiMTA2
MzBkNjgwMDFmNwpbMTUvMjNdIGdwaW86IGJkNzM4MDA6IFVzZSBuYW1lZCBpbml0aWFsaXplcnMg
Zm9yIHBsYXRmb3JtX2RldmljZV9pZCBhcnJheQogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvYnJnbC9jLzkyYWExZDk3YmQxMDE5NWRmMjI5ODUxZjRlMDA4OTE0YTBlODQ0NWYKWzE2LzIz
XSBncGlvOiBVc2UgbmFtZWQgaW5pdGlhbGl6ZXJzIGZvciBzcGlfZGV2aWNlX2lkIGFycmF5CiAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icmdsL2MvN2I4NmQxZTNjMzNiOTVhODVhNWEz
ZTZmNzJhZmRjYzJmZjcxN2UwZApbMTcvMjNdIGdwaW86IHZpcnRpbzogVXNlIGEgbmFtZWQgaW5p
dGlhbGl6ZXIgZm9yIHZpcnRpb19kZXZpY2VfaWQgYXJyYXkKICAgICAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL2JyZ2wvYy83YzAxZWI2ODYxODMzY2ZiOWQwMDY3M2ZiZjhhZWYwYjNlMzMwZGJl
ClsxOC8yM10gZ3BpbzogVW5pZnkgc3R5bGUgb2YgYWNwaV9kZXZpY2VfaWQgYXJyYXlzCiAgICAg
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icmdsL2MvNjU4ODIxMWY0ZmU1MWE4ODFjYTU2NjQ4
ZGNjNWE4ZmExNDc5ZDRlMgpbMTkvMjNdIGdwaW86IFVuaWZ5IHN0eWxlIG9mIG9mX2RldmljZV9p
ZCBhcnJheXMKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JyZ2wvYy9hZWU0MTg3YjAw
MDExYmI2NWVlMWFlZjU3OGIxZmNlYWZhZTc2ZmJhClsyMC8yM10gZ3BpbzogbWF4Nzc2MjA6IFVu
aWZ5IHN0eWxlIG9mIHBsYXRmb3JtX2RldmljZV9pZCBhcnJheQogICAgICAgIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvYnJnbC9jLzFiNDU0MTYzMjg3YjM4MzliZGZkMjE5ZTM1MjA0NTZjZTI1MWJi
ZTUKWzIxLzIzXSBncGlvOiBVbmlmeSBzdHlsZSBvZiBzcGlfZGV2aWNlX2lkIGFycmF5cwogICAg
ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnJnbC9jLzE3ZDYzMDhlN2Q1YTRkNGYzMTdjN2Y5
MmNiY2EzMzBiZmZjZmMzOTEKWzIyLzIzXSBncGlvOiBVbmlmeSBzdHlsZSBvZiBwY2lfZGV2aWNl
X2lkIGFycmF5cwogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnJnbC9jL2FmZjhlY2Nk
Yjk3NmY0MzI5ODExN2I1MmE3YmFlNmQxM2NhNjI1NTQKWzIzLzIzXSBncGlvOiBVbmlmeSBzdHls
ZSBvZiB2YXJpb3VzICpfZGV2aWNlX2lkIGFycmF5cwogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvYnJnbC9jLzBmYTM4YmE3ODQ4OTZmMmZjMzJjOWRhY2QzMzgyMmY4NDRiMjE5MDYKCkJl
c3QgcmVnYXJkcywKLS0gCkJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lA
b3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
