Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0311C04A6A
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Aug 2023 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmyGg5ihuGVImJ9EqfPakVTWwwtWHWQ1auAgW2qdeyg=; b=Ws7cSLcO2Dyr39
	YfpJ4SKdklF5lNWzyPjWor8iTGnuWrm4MrpZ+SZFgX33vh4wNW46rrwYuFGJY4ZVcxxayapVPUqNu
	CTMKLihKwJ5eKWVEKBdUzPq75DRp7AHlS6A8vAvWSncAJvuz8UNgsgjmOqlVmG1EGoEJSet1FlKDk
	Xk4yxOwV38S2PR4FiA8iRs/LMxx/yOrRN1IxnJGB4E4TWm6fybx9Pz/8dLyPguvHkmqALou32QGXr
	zM0ueR5A5e2Fj8RIcCgDm70vntSjEHnxdHhfyUCNOsqSr4eMBw1PF/zHYEerx13ufhEg92+xxXXpZ
	fS5N/Q5731AytooB0EPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSc9f-00FMFH-02;
	Sun, 06 Aug 2023 11:42:39 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSc9b-00FMDs-24;
	Sun, 06 Aug 2023 11:42:36 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-523108efb36so3900308a12.1;
        Sun, 06 Aug 2023 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691322150; x=1691926950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HumppwNUn3TA8YpQ0fQzm7WpQytFg98rX1E8vNluGYU=;
        b=COX4FRzPg5Df7S7scGkL1a1jxSkgE4lsLMpzoAKRInM2N2donpYwiXDjSi/uGQQJdm
         wnKu5zkOi4+z2eDvgysSiv8+wnzUSluY4wQ5tf23SqJnRh34l9MsjY0f81HXTwdimI/K
         GW8UQJRJil0ochVBGECpvNlVOUpC2TpR46BNRdtqybtoE/quddDakVx+BSAAn7/1Sdlz
         XZkfNvlLlGjfuEjcvAlf6iTnTjcI9tIHvIk9iB2wzLyKG0GKDLCon/LnZE/cu205nyvc
         ZpUbvtf3cSHF9m1L8NZHvlpkWXujyLx4Z8+cLnkrtFr4Tat+wekNAvvveNMSRtuJZOmO
         bM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691322150; x=1691926950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HumppwNUn3TA8YpQ0fQzm7WpQytFg98rX1E8vNluGYU=;
        b=L7p1zog8p3QB+7HJWoAZx35yhEDNiFzawXvn5row1O5ByXDQlVn7Ry6Hcl86kbxBVk
         TfenJL0pPakGkzvzrH8s1VbRCjvEw0TusipBqdssxcfBjh6BETBzjmZo0FgBjOyDcEJo
         /LZTgjDp7zyuc1vw+scvdHk8Batf4gwC+/uHSimoyXff5N236yMjvYeio6fNCIUNERVd
         jq6CoNqtAEBTOV4NPtwUME9xeZ7RaKd4Tra91ObiGm2cpcFBhQsS0Vw6j4zDJmFUtSZB
         ZtOy4umB88QcfL40ShrENdzKejq2u9yarozBK4eaEuwN8m9N9y+M2JQtdH9Ksqr4JYhj
         AV+A==
X-Gm-Message-State: AOJu0YwSmn+D1fNDGYDRS8HHbI/s975ZU5/gcAaeNSkP5M6nyWyhqpK1
	J+/8y0G/Pe4ujiGMhZqSGgGVKBAny51R7g==
X-Google-Smtp-Source: AGHT+IEEg3PkfDxHcETaO7LHnXNw+qJwjWb90KaZ3707q9E0qH0cZ2HLszMui/vhh35dCWWOEYUkRQ==
X-Received: by 2002:a50:fc12:0:b0:522:c0ea:15d with SMTP id i18-20020a50fc12000000b00522c0ea015dmr4929062edr.41.1691322150093;
        Sun, 06 Aug 2023 04:42:30 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d2-20020a056402516200b0052275deb475sm3787539ede.23.2023.08.06.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 04:42:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: John Watts <contact@jookia.org>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, mkl@pengutronix.de, netdev@vger.kernel.org,
 pabeni@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org, samuel@sholland.org, wens@csie.org, wg@grandegger.com
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Sun, 06 Aug 2023 13:42:28 +0200
Message-ID: <4848155.31r3eYUQgx@jernej-laptop>
In-Reply-To: <ZM8-yfRVscYjxp2p@titan>
References: <20230721221552.1973203-4-contact@jookia.org>
 <2690764.mvXUDI8C0e@jernej-laptop> <ZM8-yfRVscYjxp2p@titan>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_044235_682526_2E8EC2AF 
X-CRM114-Status: GOOD (  17.87  )
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

RG5lIG5lZGVsamEsIDA2LiBhdmd1c3QgMjAyMyBvYiAwODozMzo0NSBDRVNUIGplIEpvaG4gV2F0
dHMgbmFwaXNhbChhKToKPiBPbiBTYXQsIEF1ZyAwNSwgMjAyMyBhdCAwNzo0OTo1MVBNICswMjAw
LCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4gPiBEbmUgc29ib3RhLCAwNS4gYXZndXN0IDIwMjMg
b2IgMTg6NTE6NTMgQ0VTVCBqZSBKb2huIFdhdHRzIG5hcGlzYWwoYSk6Cj4gPiA+IE9uIFNhdCwg
QXVnIDA1LCAyMDIzIGF0IDA3OjQwOjUyUE0gKzAzMDAsIE1ha3NpbSBLaXNlbGV2IHdyb3RlOgo+
ID4gPiA+IEhpIEpvaG4sIEplcm5lago+ID4gPiA+IFNob3VsZCB3ZSBhbHNvIGtlZXAgYSBwaW5j
dHJsIG5vZGVzIGl0c2VsZiBpbiBhbHBoYWJldGljYWwgb3JkZXI/Cj4gPiA+ID4gSSBtZWFuIHBs
YWNpbmcgYSBDQU4gbm9kZXMgYmVmb3JlIGBjbGtfcGcxMV9waW5gIG5vZGU/Cj4gPiA+ID4gTG9v
a3MgbGlrZSB0aGUgb3RoZXIgbm9kZXMgc29ydGVkIGluIHRoaXMgd2F5Li4uCj4gPiA+IAo+ID4g
PiBHb29kIGNhdGNoLiBOb3cgdGhhdCB5b3UgbWVudGlvbiBpdCwgdGhlIGRldmljZSB0cmVlIG5v
ZGVzIGFyZSBzb3J0ZWQKPiA+ID4gYnkgbWVtb3J5IG9yZGVyIHRvbyEgVGhlc2Ugc2hvdWxkIGJl
IGFmdGVyIGkyYzMuCj4gPiA+IAo+ID4gPiBJdCBsb29rcyBsaWtlIEkgbWlnaHQgbmVlZCB0byBk
byBhIHBhdGNoIHRvIHJlLW9yZGVyIHRob3NlIHRvby4KPiA+IAo+ID4gSXQgd291bGQgYmUgYmV0
dGVyIGlmIERUIHBhdGNoZXMgYXJlIGRyb3BwZWQgZnJvbSBuZXRkZXYgdHJlZSBhbmQgdGhlbgo+
ID4gcG9zdAo+ID4gbmV3IHZlcnNpb25zLgo+ID4gCj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBKZXJu
ZWoKPiAKPiBBZ3JlZWQuIElzIHRoZXJlIGEgd2F5IHRvIHJlcXVlc3QgdGhhdD8gT3Igd2lsbCB0
aGUgbWFpbnRhaW5lciBqdXN0IHJlYWQKPiB0aGlzPwoKSG9wZWZ1bGx5IGl0IHdpbGwuCgpCZXN0
IHJlZ2FyZHMsCkplcm5lagoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
