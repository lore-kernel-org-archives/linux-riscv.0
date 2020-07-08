Return-Path: <SRS0=nZh1=AT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B03FC433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 21:10:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2970F20658
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 21:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3EkVpGsw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYy025NM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2970F20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MGdquLoRU2hnbyyCyIEq14Rj00xggAyvcBcnjoUDBuQ=; b=3EkVpGswRTbGUiFZjVoDkx9ADY
	gqAfk+d+9W2FWooxHOcONpAUIuadEuKW0eTNujo4D3K+e7vd/UvuTRP2WdaSb4rYD2h0Gv+qkEG9q
	lMNHy09HjNjS0l9qTs1iicgPhbTrQPeyC1K4f5Jfmyudl87Th9JoGL5QSQEvDVc9lthnrrC0w7LA1
	zpomWXfc5HToEQE8JM+NlfhBn8SNRI+1yLVkku4hoHuNyxC0SRbFVtaPUoHrXTO8aYdEFN9jQjf/d
	1HKo2wQBtx2vYdCtY5ribnB/hNPFWbJxR3n3uHuoRvLzJHF8k5kUah3aScEi6X6yKQxGCmwbnjuq0
	xQ/pxQWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtHKc-0003Ps-Nb; Wed, 08 Jul 2020 21:10:18 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtHKZ-0003Oq-AR
 for linux-riscv@lists.infradead.org; Wed, 08 Jul 2020 21:10:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id w3so4593133wmi.4
 for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2020 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b784eys00Qgsi/BMM5jGhHc/bDGWKgJTJjPySpMRijA=;
 b=JYy025NMzEmNSpPgiMeWuuPkd5cl0MfwTVBJJZqahDI5dLyrIPOOC9114DaSoraiwb
 I5njcBEugFseAfRHPIpZMJZLYxQ8FWV9kfzv2edy60DBDq36VPQ136CfAbBAZogz4JVw
 inmYt3WV12JZyu6v5eASjLEmtXbbnODgPc8EvSD/lYXrkCW0PvujjLUdNg/PRRoJbz4X
 7NKNti9UxIlRh7PNJ02hb++EtUCk//KujORIriqXgzcp80FHa/qrMndtm82L9mBG7eM+
 z1W6Kg0QrR013Qsj9VYvBtwB5sEXwd3nLySjz5l5FO58XETC1M/fBriY8V7MPVcwLUtS
 tCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=b784eys00Qgsi/BMM5jGhHc/bDGWKgJTJjPySpMRijA=;
 b=B9wJ24q2Qt15FZ8aVGpaFqyZ599soHwa1epurD/zkypVDehhhVE1yuFL5Pb1we7O0L
 fCClp5w8vBX8V9jAxea77Vd3J8LonzAuANqKt3enYMc3aAV8d2Y+Mpny+qHpkaBwYrI6
 QhAiAA7tmqITWUZSVST5DMnSoMAuiNvgjKXHZlnutTkfVTW/+/RToaYM946joedKANWK
 wEub3qd5KTw550atCEBBZCAVtQw+sqk9SAzR9v4KuZdMpCPyvDSZMDBEwV/BZcCMOkTh
 nSO3MWeF5uhJ0tQN13kByjJiq6tVEpXtOF76PdOO3fMTbzlV8aa85//evctYk/1gRsE/
 iK6w==
X-Gm-Message-State: AOAM532NrsS9aVTnQWVqKoe11iP0rtmDhFFD9f0BoYWvX4uEZo2cdVpc
 UT09ZFuCkkTASJAjJDeqfVr2H9YFLCED2w==
X-Google-Smtp-Source: ABdhPJymThfiher349tz4isk6gnnzkFVjonVUIrh96INg58P1oUW7qC2OG6tPlKOQAvlGqoyc84r2g==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr11193177wmg.93.1594242612326; 
 Wed, 08 Jul 2020 14:10:12 -0700 (PDT)
Received: from localhost.localdomain ([80.71.140.73])
 by smtp.gmail.com with ESMTPSA id u23sm1971515wru.94.2020.07.08.14.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 14:10:11 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] riscv: Support R_RISCV_ADD64 and R_RISCV_SUB64 relocs
Date: Wed,  8 Jul 2020 23:09:47 +0200
Message-Id: <20200708210948.34197-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_171015_409853_CC3ADCFE 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlc2UgYXJlIG5lZWRlZCBmb3IgdGhlIF9fanVtcF90YWJsZSBpbiBtb2R1bGVzIHVzaW5nCnN0
YXRpYyBrZXlzL2p1bXAtbGFiZWxzIHdpdGggdGhlIGxheW91dCBmcm9tCkhBVkVfQVJDSF9KVU1Q
X0xBQkVMX1JFTEFUSVZFIG9uIDY0Yml0IGtlcm5lbHMuCgpTaWduZWQtb2ZmLWJ5OiBFbWlsIFJl
bm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgotLS0KClRlc3RlZCBvbiB0aGUgSGlGaXZl
IFVubGVhc2hlZCBib2FyZC4KClRoaXMgcGF0Y2ggaXMgbmV3IGluIHYyLiBJdCBmaXhlcyBhbiBl
cnJvciBsb2FkaW5nIG1vZHVsZXMKY29udGFpbmluZyBzdGF0aWMga2V5cyBmb3VuZCBieSBCasO2
cm4gVMO2cGVsLgoKIGFyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIHwgMTYgKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCmluZGV4
IDcxOTEzNDJjNTRkYS4uMTA0ZmJhODg5Y2Y3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9tb2R1bGUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwpAQCAtMjYzLDYgKzI2
MywxMyBAQCBzdGF0aWMgaW50IGFwcGx5X3JfcmlzY3ZfYWRkMzJfcmVsYShzdHJ1Y3QgbW9kdWxl
ICptZSwgdTMyICpsb2NhdGlvbiwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBhcHBseV9y
X3Jpc2N2X2FkZDY0X3JlbGEoc3RydWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCisJCQkJ
ICAgIEVsZl9BZGRyIHYpCit7CisJKih1NjQgKilsb2NhdGlvbiArPSAodTY0KXY7CisJcmV0dXJu
IDA7Cit9CisKIHN0YXRpYyBpbnQgYXBwbHlfcl9yaXNjdl9zdWIzMl9yZWxhKHN0cnVjdCBtb2R1
bGUgKm1lLCB1MzIgKmxvY2F0aW9uLAogCQkJCSAgICBFbGZfQWRkciB2KQogewpAQCAtMjcwLDYg
KzI3NywxMyBAQCBzdGF0aWMgaW50IGFwcGx5X3JfcmlzY3Zfc3ViMzJfcmVsYShzdHJ1Y3QgbW9k
dWxlICptZSwgdTMyICpsb2NhdGlvbiwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBhcHBs
eV9yX3Jpc2N2X3N1YjY0X3JlbGEoc3RydWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCisJ
CQkJICAgIEVsZl9BZGRyIHYpCit7CisJKih1NjQgKilsb2NhdGlvbiAtPSAodTY0KXY7CisJcmV0
dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgKCpyZWxvY19oYW5kbGVyc19yZWxhW10pIChzdHJ1Y3Qg
bW9kdWxlICptZSwgdTMyICpsb2NhdGlvbiwKIAkJCQlFbGZfQWRkciB2KSA9IHsKIAlbUl9SSVND
Vl8zMl0JCQk9IGFwcGx5X3JfcmlzY3ZfMzJfcmVsYSwKQEAgLTI5MCw3ICszMDQsOSBAQCBzdGF0
aWMgaW50ICgqcmVsb2NfaGFuZGxlcnNfcmVsYVtdKSAoc3RydWN0IG1vZHVsZSAqbWUsIHUzMiAq
bG9jYXRpb24sCiAJW1JfUklTQ1ZfUkVMQVhdCQkJPSBhcHBseV9yX3Jpc2N2X3JlbGF4X3JlbGEs
CiAJW1JfUklTQ1ZfQUxJR05dCQkJPSBhcHBseV9yX3Jpc2N2X2FsaWduX3JlbGEsCiAJW1JfUklT
Q1ZfQUREMzJdCQkJPSBhcHBseV9yX3Jpc2N2X2FkZDMyX3JlbGEsCisJW1JfUklTQ1ZfQURENjRd
CQkJPSBhcHBseV9yX3Jpc2N2X2FkZDY0X3JlbGEsCiAJW1JfUklTQ1ZfU1VCMzJdCQkJPSBhcHBs
eV9yX3Jpc2N2X3N1YjMyX3JlbGEsCisJW1JfUklTQ1ZfU1VCNjRdCQkJPSBhcHBseV9yX3Jpc2N2
X3N1YjY0X3JlbGEsCiB9OwogCiBpbnQgYXBwbHlfcmVsb2NhdGVfYWRkKEVsZl9TaGRyICpzZWNo
ZHJzLCBjb25zdCBjaGFyICpzdHJ0YWIsCi0tIAoyLjI3LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
