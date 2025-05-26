Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3063C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0Ps7hACbdwXaHm3xFcVmp5DVHgNiHdu5I5rn3jOH9k=; b=nsJwwYY5PG//pm
	NwC2+xH02EeQPA/S1NzEAGbsmke4tfrDbTP8SNeARBNOpk30vgRGmwBbFHI/7aKBF7tmhz4zW45ZG
	jQX/JRDT8r7QZpR5qML6KNR3z2xVgX8ThA2YtN/610sNZFRMYyN1CBZFpZgA3v1vVNYWAs6K5rPpg
	7UQUtlyipSvp5OozBRVqViNcTRzSwEqrqesNBHRZxFcwUdwDGz0G0Tjq273GWL+2LmsfQv27lS/0O
	ikXwScZZkuTZzzG9pvVIC0BHLfkNp1XvZAAhivTYKcjzE0YsBIH3H8ZXfqeM5azflxL+jvPlbY/Kk
	t7ahW0yTwhaVbQ2B+lkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVoa-00000008giy-13cv;
	Mon, 26 May 2025 11:16:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVmN-00000008gSV-1jaJ
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 11:14:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a3758b122cso1284606f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748258042; x=1748862842; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qGPkkOzz/AvcHXID85KRR2dfTKt6dbyAQOGmEwhnXA=;
        b=YVZb0p2n6xrsazHlFhJbx73HKl2U3lO6AaJ/EKjAyRGgflPCVAKwdXmU/KBzxORX91
         Pv/NB0UHttjvastYwjntBrFkGmrM9eo422mfkWnvAfU7BJAPsdVmuLEg2QtMrSwmvQJ4
         57LkJA3XjnVdv1CgOJ90ZNq054R/tVntOf08IASNU4YeydRqfQMM5U4AHJDwkmB76K1S
         uE16BZ74fBGK1Yjfp8+pPebY1W4DD4ERI6DS3VGYOyPXX+WX8wVR1LS0QnihemodLxox
         MwKk8tJacqyDF7ysbBBy9jhDlDyKTCpH64C74rUAvb89GtgqmsN5bWzFeVABWTgkr1wm
         maFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748258042; x=1748862842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qGPkkOzz/AvcHXID85KRR2dfTKt6dbyAQOGmEwhnXA=;
        b=LLNWb3XzjVRo6DXgwU9Ewf7SM2jjwuaMCajHmdpkGHgSDKtCfS7xC1eW1TatFORR33
         u0k4UcvMHJGmFgO9U1e/0VyA0imtLp+nYZgcMHqI+zRllSXZwhpSZG7cCE59utRSGaOa
         zuJaUjv79jVYHBewPS/Lyv+MtQUIY4LwIJBm8u7/HFolPoLkIQi6qNIsluZdkCyYNu8e
         Q45h3eww0eabyWWmJvPzSh++hQHJfezhvDuHqc3ARfq/BTDB7STJ3Uvtxh363CiGYgkQ
         caZQgttUl+wRMa4re9kpFaePo9srBn7yB/8kp+T6k64l95MZapGm3HcIWfevgFau5S5T
         OnFA==
X-Forwarded-Encrypted: i=1; AJvYcCXWdwUwVlj3hx66QPTxnIFqllD8GkxH70OdCkoGIdDC5L1UemPy6nMJmVwcYx2zX9fuo5wqVnUmsYvgjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC6F1WUt+uUVeht8C5nto5QJLbjlxcPUp6FXr9kAMKBX3sgt5C
	9pGFAY5uYZ2/LHtA6Lq4NF8w+902M03cbNr7O4ZDF7YaLmk8xPjInpq8DhSwlR+3Tz6SHdafey7
	F3w4YGF4=
X-Gm-Gg: ASbGncsaccDUu3P4+TBq5p04/nmq4gt5ggzlnxmFttjnsbznJ5ELi0NOxMa1KLe+kbT
	DcIqDF8bGjbkssl9LI6Pp39OaROE+R8VPeGqd3GFMQFvgya7bqrwIcQ7HAYedRZCeeq2lKK1YH4
	vw04heQX7RqV4a9iW2HENelKuve/IXyBWxcELUzW7LskvNrImiy/iysHE6M412WnxvVh1yvSjnA
	UvYGproSlK9kDpHQgPI+4/+iIIrgUba+gA64I7+oNgoIy1wiSFicVqBErUUkKz2i5tE1nYPkY0Q
	BSU4N4vKMCBitqubjN87Vhj+B+hnBVQG4ipzU+wSN4WEhmpLEf8RERvtBCgQUlyxMYxIvCiy5U2
	b2IEp
X-Google-Smtp-Source: AGHT+IEohXUMBSqO1qFUGi+04cLdFeL8i/QAY/ZQ64aMi3jtMK4s6/6493H521FOcUTuehMxIQIXpg==
X-Received: by 2002:a05:6000:40d9:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a4cb4a962amr7086907f8f.51.1748258041562;
        Mon, 26 May 2025 04:14:01 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc932836sm7397037f8f.39.2025.05.26.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:14:01 -0700 (PDT)
Date: Mon, 26 May 2025 13:13:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Message-ID: <20250526-224478e15ee50987124a47ac@orel>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_041403_473563_2D2B449A 
X-CRM114-Status: GOOD (  20.19  )
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

T24gTW9uLCBNYXkgMjYsIDIwMjUgYXQgMTE6MDA6MzBBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMDUtMjNUMTA6MTY6MTEtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaC5w
YXRyYUBsaW51eC5kZXY+Ogo+ID4gT24gNS8yMy8yNSA2OjMxIEFNLCBSYWRpbSBLcsSNbcOhxZkg
d3JvdGU6Cj4gPj4gMjAyNS0wNS0yMlQxMjowMzo0My0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNo
cEByaXZvc2luYy5jb20+Ogo+ID4+PiBVcGdyYWRlIHRoZSBTQkkgdmVyc2lvbiB0byB2My4wIHNv
IHRoYXQgY29ycmVzcG9uZGluZyBmZWF0dXJlcwo+ID4+PiBjYW4gYmUgZW5hYmxlZCBpbiB0aGUg
Z3Vlc3QuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPgo+ID4+PiAtLS0KPiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Ni
aS5oCj4gPj4+IC0jZGVmaW5lIEtWTV9TQklfVkVSU0lPTl9NQUpPUiAyCj4gPj4+ICsjZGVmaW5l
IEtWTV9TQklfVkVSU0lPTl9NQUpPUiAzCj4gPj4gSSB0aGluayBpdCdzIHRpbWUgdG8gYWRkIHZl
cnNpb25pbmcgdG8gS1ZNIFNCSSBpbXBsZW1lbnRhdGlvbi4KPiA+PiBVc2Vyc3BhY2Ugc2hvdWxk
IGJlIGFibGUgdG8gc2VsZWN0IHRoZSBkZXNpcmVkIFNCSSB2ZXJzaW9uIGFuZCBLVk0gd291bGQK
PiA+PiB0ZWxsIHRoZSBndWVzdCB0aGF0IG5ld2VyIGZlYXR1cmVzIGFyZSBub3Qgc3VwcG9ydGVk
LgoKV2UgbmVlZCBuZXcgY29kZSBmb3IgdGhpcywgYnV0IGl0J3MgYSBnb29kIGlkZWEuCgo+ID4K
PiA+IFdlIGNhbiBhY2hpZXZlIHRoYXQgdGhyb3VnaCBvbmVyZWcgaW50ZXJmYWNlIGJ5IGRpc2Fi
bGluZyBpbmRpdmlkdWFsIFNCSSAKPiA+IGV4dGVuc2lvbnMuCj4gPiBXZSBjYW4gZXh0ZW5kIHRo
ZSBleGlzdGluZyBvbmVyZWcgaW50ZXJmYWNlIHRvIGRpc2FibGUgYSBzcGVjaWZpYyBTQkkgCj4g
PiB2ZXJzaW9uIGRpcmVjdGx5Cj4gPiBpbnN0ZWFkIG9mIGluZGl2aWR1YWwgb25lcyB0byBzYXZl
IHRob3NlIElPQ1RMIGFzIHdlbGwuCj4gCj4gWWVzLCBJIGFtIGFsbCBpbiBmYXZvciBvZiBsZXR0
aW5nIHVzZXJzcGFjZSBwcm92aWRlIGFsbCB2YWx1ZXMgaW4gdGhlCj4gQkFTRSBleHRlbnNpb24u
CgpUaGlzIGlzIGNvdmVyZWQgYnkgeW91ciByZWNlbnQgcGF0Y2ggdGhhdCBwcm92aWRlcyB1c2Vy
c3BhY2Vfc2JpLgpXaXRoIHRoYXQsIHVzZXJzcGFjZSBjYW4gZGlzYWJsZSBhbGwgZXh0ZW5zaW9u
cyB0aGF0IGFyZW4ndApzdXBwb3J0ZWQgYnkgYSBnaXZlbiBzcGVjIHZlcnNpb24sIGRpc2FibGUg
QkFTRSBhbmQgdGhlbiBwcm92aWRlCmEgQkFTRSB0aGF0IGFkdmVydGlzZXMgdGhlIHZlcnNpb24g
aXQgd2FudHMuIFRoZSBuZXcgY29kZSBpcyBuZWVkZWQKZm9yIGV4dGVuc2lvbnMgdGhhdCB1c2Vy
c3BhY2Ugc3RpbGwgd2FudHMgS1ZNIHRvIGFjY2VsZXJhdGUsIGJ1dCB0aGVuCktWTSBuZWVkcyB0
byBiZSBpbmZvcm1lZCBpdCBzaG91bGQgZGVueSBhbGwgZnVuY3Rpb25zIG5vdCBpbmNsdWRlZCBp
bgp0aGUgc2VsZWN0ZWQgc3BlYyB2ZXJzaW9uLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
