Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58786C021A9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3p00pHYyTlj6S1+l96HAdtpdEDEqxk2W2uXZDZ63CY=; b=i9bV4tfEdo731a
	BTQeIiqXNEb03gP+ifJS+E6x+J0JYFJB1cSizFbN9kp5SVWDENKKnxAdK3KWSQGNJzJV4b67wbLvT
	sZDW1ZhqZvGtDwvWEv8XCz4oSTmJMhOtSvGXVkD6KLyxw66EOPGS9ObH4pCDJryIbxhJljo6tzIN6
	vhlxa6WNUjZ8FmI/8J/REd4ByKnaFbe180t9YMMH+DBxT3HyfdbIu3NVeSa3eNeCQdOl4W0xSnA88
	D6ferLPnOMKFuZYiGG/alpe6fzv3p1BFrDbb4rsgqOlKBYdIvtDqkAsmVnN5lyOzspNibQdLRnBki
	0YX5bZ/QjBZTaclw6pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk17x-00000004eQR-4A4i;
	Mon, 17 Feb 2025 13:25:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0us-00000004b6i-3ape
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 13:12:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2796866f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 05:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739797925; x=1740402725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dbv6tZxsXHhtGn9KFBS5fucmEZ2CZu7fW3YyX0NKPZI=;
        b=i1Y7CXfowdE6Io6rsNZtnFar8SpGtgdECqiI3yTZXsbkwCV23TeTfJ98mlgy6Yr7wl
         6BsEs+chwBquaMGd8VXpr2KVUAL8u/HxUdylDqpGmfKaNP25CDaHT6l/VaU0pm5oETiY
         jfMlghbyTS+TGijOXpjG5u4BVRNMgjj2uE94JK8u+LHTsLA4h0hCxXXx7fUE3geLVsDV
         AQLEsqQJMINkWkt9qdVKfhfZ7NSJDhQO6XAxtxwH6LyNtG2/08p8FZYoUBc1RD+Bp80t
         wdmaCH67BrlDLFcF6fMZxfHH13WeAwddqo3Wyf78HIP0m3iyth0VXji6dWQ7wB1sU243
         koYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797925; x=1740402725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dbv6tZxsXHhtGn9KFBS5fucmEZ2CZu7fW3YyX0NKPZI=;
        b=CYA/HzzJFuJnhyIz4mYLYdyk9eN5jDxjInBTBUdPooxLyUfHtlenvyQvzDs3EivXxj
         AcQ/1KyjxjlDBNVQ1ICfqyyT4QyEyZdFl7aC8zYHmgJmDKt2bww7uQIUkROOogCL9Twz
         oZ1IEtsWxqxENi0YMZkHnVDRroDnAD49fC22BK6mTFQOyb83g0rQYXQmM6lrFch5SiVW
         fWw7NSCzgfhzI67N32cOK33QUVSft9vHfInei7W6TGio4gD3ZHrUJkUPw4PqFetWud4z
         4X3TCqoCGB2u6ZR6N/USjJICpmiMslTrAgcSHuto5k777qujWCuXGTm6t9ixm50FnrzF
         KkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb7E8IP9iIiwoxKuvDdqdLDkD1M7XSF/7h/jXr75uOCsoubEbhmoxYnrC2SHiYOX1KKAXjqYn0514/4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg41nvyUHkuQezghEGAWtunDL39NaZFDhRL5P35n79v7/PUlIY
	H33r3gJXnZxoNtpWJC6v8U707ry9BlU06YtLYepXYc4Knf3FSrL6
X-Gm-Gg: ASbGncuesKuN+8J3UnImWnmlnxm+vgXANBvVFATRZfpy42LSN8rlF8WemwSETETnVc/
	ySVxm6D+A4LIz0ckhMSwtXA65WPdsyu7KBhMydQLx3TGQBoMl1V2eslBKF/iMfjd1nWXOp/YxCg
	Crz9z/2ZhH9ejcx+DvKWoGTYCkFvKltub9DuDXg7jAaAhiAvNGgsaoebSBmlmeWbfKM7chLshg9
	ffhx1VJi9IS/Pm0G+x2b2AnHA+pKQeYzzbISMQgDxXpI5UE5WjsQ23nBVFM+GyKf8lwmjEPtLCJ
	riy6YBZ5TXGjGeI2yUd9C1aYaND5jgOJ0RX06MBXI39MlmGybi3YVQ==
X-Google-Smtp-Source: AGHT+IGI8Y+1gHpNEIL5sYVZymnBYx2kGRoduPMaxMSQCJyc4mjJ84MG14TVAegnNK2lJjDu/Lbf2Q==
X-Received: by 2002:a5d:59a7:0:b0:38f:3224:6615 with SMTP id ffacd0b85a97d-38f33f374bcmr8372027f8f.7.1739797924909;
        Mon, 17 Feb 2025 05:12:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f85c2sm12639181f8f.91.2025.02.17.05.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:12:04 -0800 (PST)
Date: Mon, 17 Feb 2025 13:12:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Carlos
 Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <20250217131203.2657cc4b@pumpkin>
In-Reply-To: <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
	<20250217092445.GA29568@lst.de>
	<a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_051206_894734_A4796FCF 
X-CRM114-Status: GOOD (  15.77  )
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

T24gTW9uLCAxNyBGZWIgMjAyNSAxMzowNjo0OSArMDEwMApBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgoKPiBIaSBDaHJpc3RvcGgsCj4gCj4gT24gMTcvMDIvMjAyNSAxMDoy
NCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPbiBNb24sIEZlYiAxNywgMjAyNSBhdCAw
MTo1MzowOFBNICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZTogIAo+ID4+IE5ldyBzbWF0
Y2ggd2FybmluZ3M6Cj4gPj4gZnMveGZzL3hmc19idWYuYzoxNTM0IHhmc19idWZfc3VibWl0X2Jp
bygpIHdhcm46IHVuc2lnbmVkICdfeCcgaXMgbmV2ZXIgbGVzcyB0aGFuIHplcm8uICAKPiA+IExv
b2tzIGxpa2UgdGhpcyBpcyBhbiBpc3N1ZSBpbiB0aGUgcmlzY3YgdmlydF90b19wYWdlIGltcGxl
bWVudGF0aW9uCj4gPiB3aGljaCBhbHNvIHNob3dzIHVwIGluIHZhcmlvdXMgb3RoZXIgcGxhY2Vz
LiAgQW55IGNoYW5jZSB0aGlzIGNvdWxkIGdldAo+ID4gZml4ZWQgaW4gdGhlIHJpc2N2IGNvZGU/
ICAKPiAKPiAKPiBUbyBtZSwgdGhlIG9ubHkgdGVzdCB0aGF0IGNvdWxkIGdpdmUgcmlzZSB0byB0
aGlzIHdhcm5pbmcgaXMgdGhlIGxhc3QgCj4gcGFydCBvZjoKPiAKPiAjZGVmaW5lIGlzX2xpbmVh
cl9tYXBwaW5nKHgpIFwKPiAgwqDCoMKgwqDCoMKgwqAgKCh4KSA+PSBQQUdFX09GRlNFVCAmJiAo
IUlTX0VOQUJMRUQoQ09ORklHXzY0QklUKSB8fCAoeCkgPCAKPiBQQUdFX09GRlNFVCArIEtFUk5f
VklSVF9TSVpFKSkKPiAKPiBCdXQgZ2l2ZW4gdGhhdCB0aGUgY29uZmlnIGlzIGEgMzItYml0IGNv
bmZpZywgaXQgc2hvdWxkIG5vdCBiZSBldmFsdWF0ZWQgCj4gYXQgYWxsLgo+IAo+IENvdWxkIHRo
YXQgYmUgYSBmYWxzZS1wb3NpdGl2ZSBhbmQgdGhlbiBhbiBpc3N1ZSBpbiBzbWF0Y2g/CgpXaHkg
aXMgc21hdGNoIGV2ZW4gbG9va2luZy4KVGhlIGVxdWl2YWxlbnQgY2hlY2sgaW4gZ2NjIGhhcyBi
ZWVuIG1vdmVkIHRvIC1XMiBiZWNhdXNlIG9mIGFsbCBmYWxzZSBwb3NpdGl2ZXMuCgoJRGF2aWQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
