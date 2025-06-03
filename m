Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C875FC5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 04:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Os3uva+0bKvuTZaOU/uAOFmykiJAXDi1HzD0qydl5ws=; b=lArI4ogD36Tt3D
	8Fbx3aUcxjzgr9pBlIjrYbbkLH3+0KvIfoR1Tk5CQFjEhfacB3mgJgrWpJwxRFx9UyV2LvFXUpOF8
	LqGZXRW9BcxKOEh4VAMaqoSnc0MlPf6M8E3Ysj5ZB3SgJghEyZDr60/xMBIf5DWQwoDdv0AvIHq84
	EPQjdOyZSMIDMoZNhaJz6lKcUMWw2HKDoePTR3ZVZC2Nm607+O8ZlPot7LImYlG8yldIV06YtPYmb
	B91sQSmF1Avhpdh5TUwOc2TBGesEL2P7yRS5ndXhuX0Xcrkho+YxuF4gGIGR3yFqGly/x/0AhGGJ8
	CsycASxnRbgjDizzeRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMJFH-00000009flJ-1BXQ;
	Tue, 03 Jun 2025 04:27:27 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMJDb-00000009fbB-1zFJ
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 04:25:44 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-40791b6969bso1779555b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 21:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748924742; x=1749529542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYvawiX3FQjGUi1Fc+zbcXEIPvfUzzjshm7bzx2SsXQ=;
        b=m6OBj87Qu4Dli9y7jVbv8HNtUQQoUwerJdiYMB6Jln1jkRVNSwlRKlR07VvNM5qIjV
         QWHOZao3WoyIH6hhFUitR60h50R80LXQ8pipgD3/H61E6KGQDTCBGmHTS2p/n7mvwRtI
         /o8/YBfhNxJ9PpAUaqjRdaavCjnVH/gUbAFAgNnhTa7tB+eHKpNUYDQBJarnhorZ6cW1
         +W1HELDh4Wwt6Bj5Lb3Vm6FAcvfxamTkseLWM3Y5Yqd41Wi2LprnXu47K7TdoC/iJDNl
         BNAQhgy+cn4WZRWDBsNjQu1TKj4thSCJfuDyHpLeyQjhwlVqV7oN6did/MFBb3Boejij
         jkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748924742; x=1749529542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYvawiX3FQjGUi1Fc+zbcXEIPvfUzzjshm7bzx2SsXQ=;
        b=xA4NYNs8GnISRyUjCn3PqN0gBpsXNKZVOcj0qGSsLcvexvZcF/1sRoAj5yQv4c7Loc
         qJexMzB6BTCSJjI/HBkVWxX1CT+HDGwbha3+ZHhHVmQlNMsOEoFQl46lj/lb65PdPOPC
         dJ+N5HK1wjz6yReuAnsLhvApw97g0eQ1LCGAQTxeO6KSpck7uglyDXS7/4+hZzn9Lxdr
         pOi6E5XcCdLHNSvllgbrK65JRMQBlOPBxrNfzH5B6+9kzck0Bc19IdCzW4T+YR4YuiXM
         pxuDiD1McPQlj3YqZpqj+E3qa5gpYJCgoHmvyzSiwlguBi/G2pyD7vv3IfSoBYE5Obhq
         dSzA==
X-Gm-Message-State: AOJu0Ywtlblah/+zmacgTcpYjv11wOKNhYx2fV/aCJML3dkeOz5w0lk5
	UzCwVKnzkbY9kE9I4s2F++W2J4VkMhwSUCeJPg4wFUOKck4L9hfcvgTv1A42axIzTaPgt3FhMgP
	VkThlsB0RYnW4KDCZn6R8MzoZgIxSE7E56WG7qD/rsVZ4vO5wlme4kbINzg==
X-Gm-Gg: ASbGncunNXTeYpvCYquAycAGqxPZI9/fyFf7KAn81LQEYtA46nFOi3b/Hb0VoGYYdow
	I2UU1eH6beO+3kiGojx5t6sOcki6ZfV+kdw33wmtvfeWFhdm58+NIt+m/B3GUEMJdpR7yeKSsPu
	Chb5dC5Y9fX+TbIN4pF/lggECGKFkiPxXSG3E=
X-Google-Smtp-Source: AGHT+IEWiYkGSNH8V5zcHzRhME/JRKM/W0OBRGYJLKWbn/Sf6C91TlZ7lvfhef8Tu3dvPzfL+0Bnlg8dTIZyCraxfkQ=
X-Received: by 2002:a05:6808:3383:b0:404:d6a3:225b with SMTP id
 5614622812f47-407a663eab4mr6315508b6e.34.1748924741549; Mon, 02 Jun 2025
 21:25:41 -0700 (PDT)
MIME-Version: 1.0
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 3 Jun 2025 12:25:30 +0800
X-Gm-Features: AX0GCFsxZtEdml0i3uc6V_kgvnUnJ5YGl582km6291QZt5VZ12cVJ1fCLYj8zZA
Message-ID: <CABvJ_xjsawGX33f1LLPeLR=OgT635GcqOSrMQpyzn6LQFqx00w@mail.gmail.com>
Subject: Question About Access Fault Handling in the Kernel
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: Vincent Chen <vincent.chen@sifive.com>, Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_212543_554355_40054E39 
X-CRM114-Status: UNSURE (   7.76  )
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

SGkgYWxsLApJIGhhdmUgYSBxdWVzdGlvbiByZWdhcmRpbmcgdGhlIGN1cnJlbnQgaGFuZGxpbmcg
ZmxvdyBmb3IgYWNjZXNzCmZhdWx0cyBpbiB0aGUga2VybmVsLgoKSW4gdGhlIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24sIHRoZSBrZXJuZWwgY29uc2lzdGVudGx5IHJlcG9ydHMgdGFsbAphY2Nlc3Mg
ZmF1bHRzIHVzaW5nIGEgU0lHU0VHViB3aXRoIGVycm9yIGNvZGUgU0VHVl9BQ0NFUlIsIHdoZXJl
ClNFR1ZfQUNDRVJSIHNpZ25pZmllcyAiSW52YWxpZCBwZXJtaXNzaW9ucyBmb3IgbWFwcGVkIG9i
amVjdCIKYWNjb3JkaW5nIHRvIHRoZSBQT1NJWCBzcGVjaWZpY2F0aW9uLgoKSG93ZXZlciwgaW4g
dGhlIFJJU0MtViBwcml2aWxlZ2Ugc3BlY2lmaWNhdGlvbiwgaXQgc3RhdGVzIHRoYXQKIkltcGxl
bWVudGF0aW9ucyBtYXkgcmFpc2UgYWNjZXNzLWZhdWx0IGV4Y2VwdGlvbnMgaW5zdGVhZCBvZgph
ZGRyZXNzLW1pc2FsaWduZWQgZXhjZXB0aW9ucyBmb3Igc29tZSBtaXNhbGlnbmVkIGFjY2Vzc2Vz
LCBpbmRpY2F0aW5nCnRoZSBpbnN0cnVjdGlvbiBzaG91bGQgbm90IGJlIGVtdWxhdGVkIGJ5IGEg
dHJhcCBoYW5kbGVyIi4gSW4gb3RoZXIKd29yZHMsIGEgbG9hZC9zdG9yZSBhY2Nlc3MgZmF1bHQg
bWF5IGJlIGNhdXNlZCBieSBhIG1pc2FsaWduZWQgQU1PCmluc3RydWN0aW9uLiBJbiBzdWNoIGNh
c2VzLCBpdCBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlIHRvIHJlcG9ydCB0aGUKZXJyb3IgdXNpbmcg
U0lHQlVTIHdpdGggdGhlIGVycm9yIGNvZGUgQlVTX0FEUkFMTiwgd2hpY2ggaW5kaWNhdGVzCiJJ
bnZhbGlkIGFkZHJlc3MgYWxpZ25tZW50LiIKCkFzIEkgdW5kZXJzdGFuZCBpdCwgbW9zdCBhY2Nl
c3MgZmF1bHRzIGFyZSB0eXBpY2FsbHkgY2F1c2VkIGJ5CnZpb2xhdGlvbnMgb2YgZWl0aGVyIFBN
QSBvciBQTVAgc2V0dGluZ3MuIElmIHRoZXNlIHNldHRpbmdzIGFyZQpjb25zaWRlcmVkIGEgZm9y
bSBvZiBwZXJtaXNzaW9uIGZvciBhIG1hcHBlZCBvYmplY3QsIHRoZW4gdGhlIGN1cnJlbnQKaW1w
bGVtZW50YXRpb24gdXNpbmcgU0lHU0VHViB3aXRoIFNFR1ZfQUNDRVJSIG1ha2VzIHNlbnNlIGFu
ZCBoZWxwcwpzaW1wbGlmeSB0aGUgZmF1bHQtaGFuZGxpbmcgbG9naWMuCgpJ4oCZZCBsaWtlIHRv
IGNvbmZpcm0gd2hldGhlciB0aGlzIGludGVycHJldGF0aW9uIHJlZmxlY3RzIHRoZSByZWFzb25p
bmcKYmVoaW5kIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBBbnkgY2xhcmlmaWNhdGlvbiB3
b3VsZCBiZQphcHByZWNpYXRlZC4gVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
