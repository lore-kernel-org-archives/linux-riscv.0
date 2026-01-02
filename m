Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89796EEB57A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8fpNoLwJ5aGacJQiwpR9zNnt6yS1RQuxQroej1kocs=; b=cOEiwlEF5XIxqe
	U+WMNmd4TujaUGrAgPcEX1JQXndAKyQc6uRtDkLsbO3WrQ6uKt2ntr3mt1TNQKP3luUYaSk84ESPc
	G/L6uTprK94H2dku95l5GAd0h+LyuGHlMeKr+dqq7JRFlPhu+un9Gh3jKJRlbKXFRmdzs0Bo45Jfd
	2oWtowkk3tyR9aeLhRu1PEx9VintcCgHO2xx3ygAmq2UZlBKDY5UjM+jqOTWvocatZZUI3+fRJzvK
	dUs/Z1WjO136JtbOdd6gm+AK5hGY/Tfmop5esh8CKCGcdDvvxPXk4s8AfNIOlUPDSe476d0xsAZmy
	Kv0FO4eqCzVfUhqiVITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbcC-000000081ra-2QDy;
	Fri, 02 Jan 2026 09:38:36 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbcA-000000081rD-0P2V
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 09:38:35 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso16908198b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 01:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767346713; x=1767951513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwhWeUrUie5hyZYttQG7hPgt9HlHhLDOoPbYGUOuM7E=;
        b=JBVCOjeAsJqaiMuaPfV0/ba75CWLIKxgFeIZY2l37JqIaArjxMk6d6D5tpGWJ5X/aT
         lTqY0Dj/ZKYQsdhfPef2AiTVvNny1mgNfiXikfACKfIkLcyO/hhBq1NEfx+WHGiqMpz0
         UGD9RjcQYS8Amnl7ObJ8GoXP16OuLJoYlD/y/rTrFpH8pGlhin84CS2XIEKpCUIbNuuz
         dWlrkIU7IJ5NlEzHZnSJ0+da6F5cantRZXQIiV2OE4qsXf0QCPJL2frXZtvxq4iXa6B5
         V2B79VYXscJ00EPXDpTx7Of7CzIx799yhtkRdBgBTwqtYrQ/HJWJ54Ik0mXw/h3a+NO3
         lJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767346713; x=1767951513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwhWeUrUie5hyZYttQG7hPgt9HlHhLDOoPbYGUOuM7E=;
        b=bCgrD+JBEePj4l/6daUtndf1GJVOgheEsTN4uRWzd7Accsxelx2Kps2CAzPaGHKdFE
         VHsO3Rwa2+JQYX6tMswd1QXS7m7iG8lX1JsHOvJoaY6/JOO2vXZ71Znv1D8Va2BArbTJ
         PdMtVL5Sm7Ys9Mi3bTWrWCCpjwCS2nkOtEKWhS/Sby1/qgdoQHnk3TZ+QeF5ZwvPbT4+
         fUOX6hI7w7Z6TgcfnUJ432Q3dXq30W7pRJpObTcFqind60j1iMXPf3jrZ+bq/BPA8RrF
         ALsBDkkzZzDA/w9RJlt2FtGC138Lqnc52wyYi8VTI3E9cfgjx+VjLnhXfTFvm+uFkEHp
         f9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUdVCc/HXBGQOwDQVeLsGPqQNZdykCSUUTPXtPk//l9pxgsrU/Xjl6zntJYmyE33uCXWUK6uwboJHzyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWYMORIYse8z8/y55tAl8LxgPvu8GqmDvA+2+ddjXXK8a0kZP2
	9AkhiSDSL/xosfFrnghlLe9tLLmahHfBUrUesbhQDSLS7y2MWbNADroJ
X-Gm-Gg: AY/fxX6lA9JkcwPWbY2Xgrbiwxj6IcfoISHJtqNH3oQMGPJxwDWWz6PAPyQV0y3zv9N
	UNlS/lvCAHrtgFB61W+RG3v/GLMk+WnCF9C9mBZcgzfFkdwyv6MJYEW2UcARMbOrlHuKB175fKu
	8o0e3T7PWalni0xkuKICIdwIq6op0ZUFKz5U5Mi4f7XY//lFCcxfFsKjxKqSOHmGSyVfmWTEMwn
	Az4T+qZ6VzRy+iZhmkh9mq8nXAJsmpYrV7Tp9imqHVI4UDqmP/jjcxsCbzarGgRDPgY0QS8LITh
	loga1UmK6SApIEjFbDGnIWkOQvbCyw3PkAYgULxSST+W7F1qHdKBw5vlmpgD/Zvmi+UEoyBdDhS
	5efOxiYvcWaBORsRhPc3j0PQE2s/jFfVeUHz90WwgJLz4UDDufWW/2yWh2C7yK9Mf3V1z1/0zn0
	oksYI4k8m6XONs33OjOmQAQZ/juKWUmzC043SE
X-Google-Smtp-Source: AGHT+IEPKnJZiVW+ZjQMzr1s3UZY7zlimkXWRy8RZhKuALAzMn9XlNWaqI02+XA6z8lylihvHGysrw==
X-Received: by 2002:a05:6a20:938e:b0:341:c4e5:f626 with SMTP id adf61e73a8af0-376a81e76a8mr39650137637.7.1767346712639;
        Fri, 02 Jan 2026 01:38:32 -0800 (PST)
Received: from jvle-ThinkPad-X1-Carbon-Gen-8.. ([114.241.85.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7cb01a9asm34594544a12.35.2026.01.02.01.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:38:32 -0800 (PST)
From: Keke Ming <ming.jvle@gmail.com>
To: sanjayembeddedse@gmail.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	tglx@linutronix.de,
	virendrasinhchauhan1206@gmail.com,
	Keke Ming <ming.jvle@gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: adapt to syscore API passing context data
Date: Fri,  2 Jan 2026 17:37:41 +0800
Message-ID: <20260102093744.66053-1-ming.jvle@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
References: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_013834_159139_031400A9 
X-CRM114-Status: UNSURE (   8.71  )
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

T24gV2VkLCBEZWMgMjQsIDIwMjUgYXQgMTY6NDE6NDYgKzA1MzAsIFNhbmpheSBDaGl0cm9kYSB3
cm90ZToKPiBUaGUgUklTQy1WIEFQTElDIGRyaXZlciBzdGFydGVkIHByZXNlcnZpbmcgc3RhdGUg
YWNyb3NzIHN1c3BlbmQvcmVzdW1lLAo+IGJ1dCBpdHMgc3lzY29yZSB1c2FnZSBzdGlsbCBhc3N1
bWVkIHRoZSBvbGQgQVBJLiBCdWlsZGluZyBhZ2FpbnN0Cj4gbGludXgtbmV4dCBhZnRlciBhOTdm
YmMzZWUzZTIgZmFpbHMgYmVjYXVzZSB0aGUgY2FsbGJhY2tzIGRvbuKAmXQgcmVjZWl2ZQo+IHRo
ZSBuZWNlc3NhcnkgZHJpdmVyIGNvbnRleHQuCgpUZXN0ZWQgdGhpcyBvbiByaXNjdjY0IChjcm9z
cy1jb21waWxlZCBvbiB4ODZfNjQpIHVzaW5nIGxpbnV4LW5leHQgCihuZXh0LTIwMjUxMjE5KS4g
V2l0aG91dCB0aGlzIHBhdGNoLCB0aGUgYnVpbGQgZmFpbHMgd2l0aDoKCmRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jOjExMToyMDogZXJyb3I6IGluaXRpYWxpemF0aW9uIG9m
IArigJhpbnQgKCopKHZvaWQgKinigJkgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIOKA
mGludCAoKikodm9pZCnigJkKClRoaXMgcGF0Y2ggY29ycmVjdGx5IGZpeGVzIHRoZSBjb21waWxh
dGlvbiBlcnJvciBieSB1cGRhdGluZyB0aGUgQVBMSUMgCmRyaXZlciB0byB0aGUgbmV3IHN5c2Nv
cmUgQVBJLgoKVGVzdGVkLWJ5OiBLZWtlIE1pbmcgPG1pbmcuanZsZUBnbWFpbC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
