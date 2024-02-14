Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD67FC48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmm3s2oEe0LieIXiCSGThywwtpI1QaA4s92MCBCl3bI=; b=ZFGcccoPNg7egf
	JFY8DvXw1czHdkATzLgjhd9ZAYv/8GoE2fQ4Mgt72evf+N8di20z+5ir+RnwSDKFeeu9kpVsppvou
	+YD7x7ZWr+aXvGSp9ofeigTK4nEw7B2m46CUXfc8qMM42xnl9V2ZO4FiE8Q/MvT5F4zrvq2EGbZTP
	O695eFqLs5UnkQc0J5KFqxOHW4tgU6qaTjhINomXSMglMOE9Wvg4XJHoIVD37t+ABZcgBg0CVz/FD
	QfAMqemR0AeXnWkQSTRoi3I79Koi7wHmg/beFRmoRFIz1/n1vUc2QNlPwrKnNmTEdo9bMdiEHwp4I
	Xyr0sA+L8UcXHyb48gNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raGCh-0000000D9wz-1IDl;
	Wed, 14 Feb 2024 14:25:39 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raGCe-0000000D9uO-3dkC
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 14:25:37 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5114b2b3b73so6521014e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 06:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707920724; x=1708525524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jtunily3ID2ggNdumWrfsLh05PSLNGzlYQIE52GtrB4=;
        b=vvHsh2w52HyBrFQ1q9+/VqwusXjdWc7DC1SAY39/n3pk9EB3Yar52/tigO3hO2MBCv
         6ke3F1pvPshqRPAsm0J/UAdBUlpPQbyfPl1WHJeDAdfTZnEhd+dfzThozS1UYVaB6RMW
         HD5s/7gQScLGFm3QVRepd0FzgfWCZZbnzf0zRgK3S8wVDfPC6ULP0ZjrkH9/9/OpLDDM
         xESwZKMqlyynoo7PlKN0DJSN63CyZ4lh5oTl4itqIDZQbxH7vJd29NncXR+cFLoN0vzi
         JZCsvidQ5Fx9ScoCE8OHZnAf64bgfjRT2+IjC7OTbzAdJryGN3A4usSLyiulllE9hEe7
         EI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707920724; x=1708525524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jtunily3ID2ggNdumWrfsLh05PSLNGzlYQIE52GtrB4=;
        b=dBO+ts7G5lhHuRhtx38msImyIFg+AiTUuGbiorkmPskuKtcWbOG8V/nUyZp9FxKZh9
         xOH75wKVg33ex3txJwr3zhPKS8ZSdAZA4pRz2sDktf3XNVOiM70rJtnx92iEvXLj5XDN
         DqsD7B3mYJvaIal6M4Lljl3iDTHJ5WQD0g7v3/kHvEUwEFqW9LSi9LLwDJbDi7u6iFl7
         cddaYxbVLdKHt6NsNardpTfk3r7cXiYV1Uutpe5Xp5wjLY3G6YI9SsWR32ls7xXp+Tvf
         RoTTISniytdpmEPgC1ImcJpsDNh5GUH5EL40BMi8IO369FZOSyuXHf+KFjwAiZ2TIshq
         HsLA==
X-Forwarded-Encrypted: i=1; AJvYcCXDd/OW6gZ2Q3RL5hd2UU5lzwedwP+gXp+62OSTXry8FZosGLfJJbYTLm/SoBkJd5EyYJq5Jt3BhU1hIOV8sZxC6s4IvuS108IsvlHYiudE
X-Gm-Message-State: AOJu0YwiIBGo4jqtQFLt11yuPU4h83DYokUlqnx6K3X4OOnTPsXfZnJD
	+++gG3XlNFd89Osaxld9GxLHIVhjSa5K9xvkZiftU+NQEUkEqzb4QXpL+LnMYsWacipqu2S6DHj
	zQUjjX+ywkYi+ekhDA2YHcH/F/y6hlQfRRyLuUw==
X-Google-Smtp-Source: AGHT+IGj5b9s7j1rq/u5e3Ei42FYaZcMYl/f1nxg2/Z2HDUJLX6SaB3gN62Pg16uiForO3e0uH6cCc+u4sPccjA4aOI=
X-Received: by 2002:ac2:4c2e:0:b0:511:48aa:d621 with SMTP id
 u14-20020ac24c2e000000b0051148aad621mr2053788lfq.66.1707920723938; Wed, 14
 Feb 2024 06:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20240202-disable_misaligned_probe_config-v3-0-c44f91f03bb6@rivosinc.com>
 <20240202-disable_misaligned_probe_config-v3-1-c44f91f03bb6@rivosinc.com>
In-Reply-To: <20240202-disable_misaligned_probe_config-v3-1-c44f91f03bb6@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 14 Feb 2024 09:24:47 -0500
Message-ID: <CALs-HsvLH_QYUViSBuBgF4vW_X4CJ3M8tgOVfAHi5WdVXx54fQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: lib: Introduce has_fast_misaligned_access function
To: Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_062536_924924_9ADD39ED 
X-CRM114-Status: UNSURE (   5.59  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMiwgMjAyNCBhdCA2OjU04oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBDcmVhdGUgaGFzX2Zhc3RfbWlzYWxpZ25lZF9hY2Nl
c3MgdG8gYXZvaWQgbmVlZGluZyB0byBleHBsaWNpdGx5IGNoZWNrCj4gdGhlIGZhc3RfbWlzYWxp
Z25lZF9hY2Nlc3Nfc3BlZWRfa2V5IHN0YXRpYyBrZXkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFy
bGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEV2YW4gR3Jl
ZW4gPGV2YW5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
