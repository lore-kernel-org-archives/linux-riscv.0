Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485B1C021A4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzNRczNl0IegwmdVUNPY1Z8cjLBtOvmLbUGMIO5qSMs=; b=RotQqgW7ZAVtM+
	O3iag7V/kKqrmllEZuG8HEluti6QOaVthMI1BJ9BITA4Qt4f0SWvRBXm3HW6wpht7h3NVSZsZXLCS
	x18b4xOsF4n/on6Oh/bqYOs3irXLVZ54ANsoJZxmZPqyS8nWBBuhgf9xZyiAk3aAblxVayZtcR3qt
	LOvjbJ28XE/GsbOhunK/Ph+zXMdEmNn6AAU5SYP8XzCFviemM3r3roItxs8kYSnP6spG220ogQeKl
	Gt1k/OwMC/9G1xljJDiZpu1yZALToDuW9SeAyZwr/dnkTThsJUFd2edXdbr59L0PIFhaZJteWh8Tf
	FuUHZMaGsW0hqGFaYkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titar-0000000EcXH-3ouY;
	Fri, 14 Feb 2025 11:10:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titZm-0000000EcN2-0qCy
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:09:43 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7fa1bc957so355351666b.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739531380; x=1740136180; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aigpur5if5MSlLy9b9P0vOHm3NgsJ9o8CLycgKukS10=;
        b=VEvl0QLQ1GqqGAOXXTikikv1jeTxv4OqNDtsznxbbFwHRGBKfH4PKYHQ5bkqmt4hzw
         ZTFIc/IsuStpq1rZqXyJFymXoa/bGWWfDg/wPisEB57yv8FgwbBu5UOJ6tlvX3qi2Itk
         7ZEXGqS4utphh5CB+cTQBJS2axjqMHNBbj2EA4f+muoS7TYa7QZrc5W0ICouOMcrbSy/
         esBF2FWF2LVZwIN7b/U1cyXdBoZDeUPXnCWUx43vAOXBzVeS9hgfxlIdszc7P9ilYbqt
         2s/xwAixaVy54AFGY7644KBmBGGCtTkd7acaimhLik7lb3Kf9IvWfZx1F0KbdrucI97j
         Qw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531380; x=1740136180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aigpur5if5MSlLy9b9P0vOHm3NgsJ9o8CLycgKukS10=;
        b=nVzAqVCRojSp9QYuRFxBl7RJeJD0SwRvmzqZ7/XZO8mvMKr34cMjKrnv2GjD/vG6Os
         7T7p+OPxsLsTUBOv1xwNJoLaGMC6S454iezNDINQNwvxFyJSYjwzHXfTiAzdM5BPLNrd
         UY9mGKJudSuDobDYnpBy2LJ7DhMzYtd7d7r7Ct9MCUU1EIOlIFp895y8LO1oIaNc3bl5
         fccLQhZW4vi4AxP/DXjHgjRPpUdcSW7/XiIjcQJ9ZdGcWCBGUpFqdOEzz6wT0nmqHdqQ
         VNeHVonveS5lOB6i/1WSma7EHy4/sDgBK5oWqAY0sNGyF0wgBPIFVG4DJx9BBPYx6zuO
         0D6w==
X-Forwarded-Encrypted: i=1; AJvYcCU0GtnlEApsREANeFtqeoTTdMdzm1cV4l2JlsuzXgAj3YQi8zNVX7mVjocbSLsPfxnSlaFhyKmgA5nMaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwhXAMRDq+DDu1sBOaKwdXErKmOFlSBUQUUURRWQmFXxh1nceq
	vnDF0/wCS8nwLa29TPXYmxNhpctBm1HOM9ebUmJb2vX4O6tpvf/K
X-Gm-Gg: ASbGncv62sH2D/7MTEz3TK0ZkIQzQM9IBz560nDSeqeFs6jyeoR1CBnZuf9bcZVS/q2
	swak+fjJ1LB9W+H2wOCIaIm1WUQPjCQaflD3uscZgfyK1EXqLJ10zvi8KtVEvPlRQ82qR74HQO6
	Tn999ffXQv8gSZbhnMnEmdbq4q+LfZOSiY8tb85Dldb4JZ2ayorBpQsNvC/T0IA0OTf1Woesn6m
	O0BgVckR4KYZgij/ZBFlA436nuFXDPlUmmCxBJGpQieKQ5E//O92aw6lHdTRlcw7l3fcQicTMCp
	svXHQkga8ccxuUjXt37ESPlH+qhgBRP5
X-Google-Smtp-Source: AGHT+IEX8u4B+i9w7ZDW/hBhkVNRcW+7tzz1yY2Ss5mruSCSTtkcNIfQ5b1LN+2uvhhVxWkQSF0igw==
X-Received: by 2002:a17:907:3e9c:b0:ab6:da18:9a3 with SMTP id a640c23a62f3a-aba5017e3bcmr646004066b.46.1739531380181;
        Fri, 14 Feb 2025 03:09:40 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm2746739a12.58.2025.02.14.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:09:39 -0800 (PST)
Message-ID: <964a016b944b459a9a914abac539350769323259.camel@gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, dlan@gentoo.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 12:09:37 +0100
In-Reply-To: <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
	 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
	 <t6z6rikut2him5m57b6xubbguw3llczp4i6d5frcpuhlqihf2d@booethzadxsq>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_030942_237685_0DFF29BE 
X-CRM114-Status: UNSURE (   9.88  )
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

SGkgSW5vY2hpLAoKT24gRnJpLCAyMDI1LTAyLTE0IGF0IDE3OjQwICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+ID4gK2V4YW1wbGVzOgo+ID4gK8KgIC0gfAo+ID4gK8KgwqDCoCAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gPiArCj4gPiArwqDC
oMKgIHJ0Y0A1MDI1MDAwIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNvcGhn
byxjdjE4MDAtcnRjIjsKPiA+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHg1MDI1MDAwIDB4MjAw
MD47Cj4gPiArwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKPiA+ICvCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8Jm9zYz47Cj4gPiArwqDCoMKgIH07
Cj4gPiAtLSAKPiAKPiBKdXN0IGZvciBjdXJpb3NpdHksIERvIHlvdSBsZWF2ZSBhIHdheSB0byBp
bXBsZW1lbnQgdGhlCj4gODA1MSBzdWJzeXMsIHNpbmNlIGl0cyByZWdpc3RlcnMgYXJlIGluIHJ0
Yy4gKFlvdSBjYW4KPiBjaGVjayB0aGUgY2hhcHRlciAiODA1MSBzdWJzeXN0ZW0iIG9mIHRoZSBT
RzIwMDIsIHdoaWNoCj4gY2FuIGJlIGZvdW5kIGF0IGh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28v
c29waGdvLWRvYykuCgp3ZWxsLCBJIHN1cHBvc2UsIHlvdSBrbm93IHRoZSBhbnN3ZXIsIGFjY29y
ZGluZyB0byBob3cgdGhpcyBoYXMgYmVlbiBtb2RlbGxlZAp3aXRoaW4gdGhpcyBzZXJpZXMsIGFs
bCB0aGUgZnVuY3Rpb25hbGl0eSBjb3VsZCBvbmx5IGJlIGFkZGVkIG9uIHRvcCBvZiBSVEMKZHJp
dmVyLiBEbyB5b3UgdGhpbmsgaXQncyB0aW1lIHRvIHJlLWRlc2lnbiBpdCBhcyBjb21wYXRpYmxl
ID0gInN5c2NvbiIsICJzaW1wbGUtbWZkIgp3aXRoIGNoaWxkcmVuIG5vZGVzIGZvciBSVEMgYW5k
IHJlYm9vdD8KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
