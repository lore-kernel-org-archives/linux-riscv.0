Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4074F606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2njaoxfI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FCxpY+74
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VvuRE8yvX66BwwexLHroCix4uXfiU1Uru9vTLkkZcqU=; b=2njaoxfI/K2G52PKX1Y4YJ+l2Y
	z969RoqBdQuGKL24+SGLcSzDMXucM11Xhwt40ZaTTncPUMhPdpk0LicsqyQsM+gh8kd9Q3q41UpfI
	rDTHkcC4QsKC6eEZFjrf+BG0coMHpOxxKQ6CmbVqwhPYmb0hN5S/mqZpNRVlhf2vDKFps1iX7xGCP
	Anyfa77lGI3j1Wy2cczGPTrkzWuo9UdEO8pjTNS6ueJ75BKJqTvcNt1m5aNyugsLncZzTGMgi+Nt6
	oRd+DCHD4PejEUQgQGu4CqKCGI491bhjBhX1jcQDZX8UMnCZRdpr7hTGlw5l2B1sFVj8Bxq6wISIw
	vnsV/9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMTF-0000000BZki-24QI;
	Wed, 25 Nov 2026 23:32:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMT0-0000000BZSP-118j
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:32:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5882174f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649516; x=1796254316; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
        b=FCxpY+74bynjsx8yPI4TGrLgV0ALFmsuOdaL6i8dtxJ/8ahrK0xjhuGMF0gaSrsRyn
         8QWpQ3PwXjP48HI4PpoaWMyETIXc9kvC2e4KBT3b86AUZjKxBQLcr4B93rAJrm0c1KUn
         RpF1O9AvWMMT/8NPnqljNbnP07+QpF0zDx3i007yRyfzvWBYiAesI9N06cGNuP5frKXT
         p1NyKJiA2e9w7zNMbnrzDH2uJS27Tx9iscWsT8rfr5EW43lHPk+epcAr+dGEi2ZBgNne
         qpOFxa1pH45CyVCiodjoAoFlDJwikhzSokX+aN6AfffdJ0KQ3POiXlpmrrv4PPa91Es1
         9dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649516; x=1796254316;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoTtAD1OqVBDFgxHKsrJhCe4WsEnyH1NTYB4QO/bzrM=;
        b=Q1cmD85ztkrvRg04tUFbwmRlCRqFKKR+zKsQyir3fkTy84QC2yCmWQRutxGXL7T75r
         QVkU31b4KljG3jy1IEfTCCmB2KdIAlezSerUnoQtoD/glPnXweWU3H/NQtr4RwTDkLA0
         8JWIYbMlcpkziCV1c3dRgD+kxIEmX9Uqd2xGBCOmfPP2S15o0IbSm28TyNoSlAgW+eM+
         b4GVEs1QuKZuoik8oH8+IHWYUn4Dlvaa1puwRPkopKs2xPn330SY6cj3M+/P1iql+wKg
         i6sCBqlsVtTrJb51cRPqLAfTflGUOzXjBqIo286IRr5Mz9ZIxQirPj5sMR5NKsKzlYjn
         Cocg==
X-Gm-Message-State: APuU4Z/PEQH+K9aWVsQ9DyZFIus+11FkKMjiU4sWHacaidQErHGHfa17
	TA9cAR2ReeWIxUTaYiSnAJN3HS2mACfR6g3A8d3OxwpT6Pfi8S2gOtLpEPQX5UazHO4=
X-Gm-Gg: AZFdTZfRkd2Cklu57MhQ9QY+PEAuz+X9gTYsIohYL3pKWKioMs87RQUTZZygS1tquHi
	KJGHVzosXDDXOJwWsuk47QfwWUAzbAHWW/oS92s5po1na4L2MtJqWeP7xqEqqyGnyWDSmyKPKly
	NZj9YIq3nKTURzZIrEGYLRCNTjMqLZy/1Tw7f4pIQvylGYUzCjkg/m3CPtnNquCRorFdCZt2QRz
	HyfRKDTyOLk0rpckz9fO6gT0xdG5YD0Lze9O4pj6eZfAq6Ny8kfKhiVzf4Z/lKIay3YkIvgCL/S
	vGikhXWumgoQcqz8kvdc1lVxATdvMetxLt5KH8vI0dBL8NBPjjMx+YGXKHMVdA3e6HSX8mjNa6E
	keVrBDXawxyzQD05ZEafGCDcm1572cDfm3LsUMcipDs1eEjxa/8rlEea4W08tV5yGTobXirdJfN
	4bKW3pUTV76sXG/RIbJBr+ITADTzafd4kCyJammFh5GAiresHO/aYFWj/PKdL9ctZIjTeAKXaLG
	YvFxCinmdNtZJM3e0kdA0SfVJwOPLa3lEu3Ileeru808t+fU8byM2ubKf5lB0iSCcFiTtz8LOsd
	EmaLX3Ba4++HyNDmbcQIbbK0hrVHfa0LFFfK1KUNVDJczVCuREiq5Wj52cvGuZLuxGBg/MSHxYD
	r83lYC5qrHA==
X-Received: by 2002:a05:600c:8906:b0:4bb:a60e:a316 with SMTP id 5b1f17b1804b1-4bba60ea355mr53876185e9.12.1795649516228;
        Wed, 25 Nov 2026 15:31:56 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm33573217f8f.17.2026.11.25.15.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:56 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 16/19] dt-bindings: riscv: Add Waveshare ESP32-P4-Module-DEV-KIT
Date: Wed, 25 Nov 2026 23:30:17 +0000
Message-ID: <20261125233020.1380594-17-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153158_430772_97D910F5 
X-CRM114-Status: GOOD (  10.67  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RG9jdW1lbnQgdGhlIHJvb3QgY29tcGF0aWJsZSBmb3IgdGhlIFdhdmVzaGFyZSBFU1AzMi1QNC1N
b2R1bGUtREVWLUtJVAp3aXRoIHRoZSBFc3ByZXNzaWYgRVNQMzItUDQgU29DIGNvbXBhdGlibGUg
YXMgaXRzIGZhbGxiYWNrLgoKQUkgYXNzaXN0ZWQgd2l0aCB3cml0aW5nIGFuZCB2YWxpZGF0aW5n
IHRoZSBzY2hlbWEuCgpMaW5rOiBodHRwczovL2RvY3Mud2F2ZXNoYXJlLmNvbS9FU1AzMi1QNC1N
b2R1bGUtREVWLUtJVApTaWduZWQtb2ZmLWJ5OiBWw610b3IgSHVnbyBTaWx2YSA8dml0b3JoZzIw
MDgwQGdtYWlsLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3ByZXNz
aWYueWFtbCAgfCAyMiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9lc3ByZXNzaWYueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3ByZXNzaWYueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3ByZXNzaWYueWFtbApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjU2NGU5M2NkNWYzMAotLS0gL2Rldi9udWxsCisrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9lc3ByZXNzaWYueWFtbApA
QCAtMCwwICsxLDIyIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL3Jpc2N2L2VzcHJlc3NpZi55YW1sIworJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBFc3ByZXNzaWYgRVNQ
MzItUDQtYmFzZWQgYm9hcmRzCisKK21haW50YWluZXJzOgorICAtIFbDrXRvciBIdWdvIFNpbHZh
IDx2aXRvcmhnMjAwODBAZ21haWwuY29tPgorCitwcm9wZXJ0aWVzOgorICAkbm9kZW5hbWU6Cisg
ICAgY29uc3Q6ICcvJworICBjb21wYXRpYmxlOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDog
d2F2ZXNoYXJlLGVzcDMyLXA0LW1vZHVsZS1kZXYta2l0CisgICAgICAtIGNvbnN0OiBlc3AsZXNw
MzJwNAorCithZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQorCisuLi4KLS0gCjIuNTYuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
