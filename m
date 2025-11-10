Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD7CCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfwLpP0Gxppdi9KcTLtOt1EPyNspjG1/pZfA1aJ6OrA=; b=ZFHq6HcQQldIgS
	qR6CQ+RTSSJMIX4tDyL015pQeS3frSPcWTSnsABSHDJsbOLT5WePaFEaKdNXFm8vzI7KS1zn38A/X
	x39jnRPN6THhXDL1vxbEgfJZncfGRCZro3E4LYDa0eShos86yj1DA58K3XGGnESRsTMcuQmSkHDtH
	mSsEZMtTTJ2/oGMx+cVxpVRZ49wcpAzK6S8mB2bE6a68n1WqNTNBciXr/YIpDAF5E19meLR2jUcpB
	0k0YCfJxPTSEkFtCkxWGl7wT3Xw9Atfxs/o5ceqO8fmA+VtLDLYPO5fuKUCe74MEeAIm6jZnnpfbv
	FilNQKQtFchmzFPiEkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITSg-00000005eXQ-2Fzr;
	Mon, 10 Nov 2025 15:05:42 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITSe-00000005eWv-1boE
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 15:05:41 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-7c6dbdaced8so2182674a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762787138; x=1763391938; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLIkqGwA5TFLsjPNFy0EVjpciOH8eLZgKkAfRn9EpW8=;
        b=BAM2pL20wrjE0y1oljlnBU6VUb5bBapue1pgpCAKFSYjgA6UEBL7zcWhgFrgzeX0L4
         Tjz+Dl4vzUtUHNEeRr1jA5KaZ6FbZKqs0brUbVzChpGRfiZZ2y337qvIA1uks5A9QHsD
         tJaRfkhkMowJaYH157F14wmZu16qhMdSpGYNWRVFWb/47dIlaMT/Vhq4PicVVR5x4Sud
         8ENGENQsASsR5SlhSmjDjceea7hrdVzyOQPcEYwnu72koKENNZfIsx4bFEeMaZX1b3iA
         NmIKfBO/IjaZ+bEQHz14vwYZNVhy77PiAcS8L0WTHRSI3soZoZkzTd7p9d7fHXYqau6+
         OzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787138; x=1763391938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLIkqGwA5TFLsjPNFy0EVjpciOH8eLZgKkAfRn9EpW8=;
        b=TdHAYcT/O7F/C91me+Yb0/yWGiOY7Ck9/wnxZ/KwKNefV5iX/vIKWRgajo6q8UwAGR
         f8O65dUyqdeHhYHmMSBFN4Mf812ooEDMm3tYKZ/EgQpA/FASWOEZUIA6x3eh8Nt3zPxr
         5ZW1RKqsfJgmsL/pChGxJf+LPjbKfT/InkoI6l1gtJUASu2ikmOzBddZSav8iU99Ylvj
         M/Md01QIWG2fdbKb4xJozfkLUB6pQ8pwxe8Ose6ZCHkpqU/z+YEfuNON14kt8T4Y+n6c
         /fsuoAliFHgl+dfuAv5qXqWSP4+tnjJ5VluijXYLcS8Vo0gJN/xQclTCRRxj2IKrBPbZ
         E4ng==
X-Forwarded-Encrypted: i=1; AJvYcCXz9LfmHftTuEgCepYzPP+DdRDtsmJXIX27+wv1CX4EJFGDaieDY3EPmcGxAcj+ePGu32Y5qXqHRxYwJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS1VgagfR+nH/D57i/j3RIEVotSTCS8w9HvfplbbghKzVACuQ2
	eGQKj8QTR3fzWfUQl8VhizBkT/RiRNhUYgbH9dscKvZ/XpKa7XT/pJXIyMW8Kj4tpTc=
X-Gm-Gg: ASbGncvqZK9eho7t8Xt4GZMysShw+tHPlF4zvAETrj/MQYI0Tg+cjjlGSWfCgAGAGam
	T1DiAxYeKYGDyLaCyrEBCULyluJT1pLvA1thsNkJ70y1WnKyEnJewu/8hS9zX5Fal4gmkL8qgU6
	7b/FHTIwhIS4Tp0A2Ic7vnqCDwcvofFymu9312zxU2j7dXL+jj10DL81WbMLJ6WfbVcHE6RGk67
	5XOtEK0Q4dnp/Nddzo/j2dmWPvBFDLvFm64DlNsF8r59SP9NTHJ6iIsLrwZ6QGwctPq1KiRq8O7
	RRvtTpIodIqjhv2Znlc5cUsGH2W+QXbyRSO585r96iI5VYgzUz3AdI63rK3bVNM0ejM1TVKHNYQ
	jrIcLgXjsEwrA/4Z8AR4wbrTKAu+D4zsPbn6IhM8gv9iqwilxnd6p9NpTW9qLnYc2uVTSDwuzSV
	qjGPLXlUCccFv7TmBmqqbBMi323yDRqexKJg3Q0GM=
X-Google-Smtp-Source: AGHT+IHgQiveeEt2TcyVpw/M9TZjIcS1T8WMm/l7R5G//yZo5AlEVPBUPldB2kYOGjXywx6gsdENHQ==
X-Received: by 2002:a05:6808:c015:20b0:450:2e22:ed72 with SMTP id 5614622812f47-4502e230e41mr3451947b6e.5.1762787137562;
        Mon, 10 Nov 2025 07:05:37 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b74695bb6bsm4940807173.42.2025.11.10.07.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:05:37 -0800 (PST)
Message-ID: <4a7d6e07-82f8-437f-bccb-cf294974a53e@riscstar.com>
Date: Mon, 10 Nov 2025 09:05:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] PCI: spacemit: Add SpacemiT PCIe host driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com
Cc: dlan@gentoo.org, aurelien@aurel32.net, johannes@erdfelt.com,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com,
 thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
 mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 shradha.t@samsung.com, inochiama@gmail.com, guodong@riscstar.com,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251107191557.1827677-1-elder@riscstar.com>
 <20251107191557.1827677-6-elder@riscstar.com>
 <120b2f62-25e6-4ea3-9907-230080c61f70@wanadoo.fr>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <120b2f62-25e6-4ea3-9907-230080c61f70@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_070540_650224_44EC8B2A 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvOC8yNSA3OjAwIEFNLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gTGUgMDcvMTEv
MjAyNSDDoCAyMDoxNSwgQWxleCBFbGRlciBhIMOpY3JpdMKgOgo+PiBJbnRyb2R1Y2UgYSBkcml2
ZXIgZm9yIHRoZSBQQ0llIGhvc3QgY29udHJvbGxlciBmb3VuZCBpbiB0aGUgU3BhY2VtaVQKPj4g
SzEgU29DLsKgIFRoZSBoYXJkd2FyZSBpcyBkZXJpdmVkIGZyb20gdGhlIFN5bm9wc3lzIERlc2ln
bldhcmUgUENJZSBJUC4KPj4gVGhlIGRyaXZlciBzdXBwb3J0cyB0aHJlZSBQQ0llIHBvcnRzIHRo
YXQgb3BlcmF0ZSBhdCBQQ0llIGdlbjIgdHJhbnNmZXIKPj4gcmF0ZXMgKDUgR1Qvc2VjKS7CoCBU
aGUgZmlyc3QgcG9ydCB1c2VzIGEgY29tYm8gUEhZLCB3aGljaCBtYXkgYmUKPj4gY29uZmlndXJl
ZCBmb3IgdXNlIGZvciBVU0IgMyBpbnN0ZWFkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEVs
ZGVyIDxlbGRlckByaXNjc3Rhci5jb20+Cj4+IC0tLQo+IAo+IC4uLgo+IAo+PiArc3RhdGljIGlu
dCBrMV9wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7Cj4+ICvC
oMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4gK8KgwqDCoCBzdHJ1Y3Qg
azFfcGNpZSAqazE7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIGsxID0gZGV2
bV9remFsbG9jKGRldiwgc2l6ZW9mKCprMSksIEdGUF9LRVJORUwpOwo+PiArwqDCoMKgIGlmICgh
azEpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gKwo+PiArwqDCoMKgIGsx
LT5wbXUgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlX2FyZ3MoZGV2X29mX25vZGUo
ZGV2KSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTWVNDT05fQVBNVSwgMSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmazEtPnBtdV9vZmYpOwo+PiAr
wqDCoMKgIGlmIChJU19FUlIoazEtPnBtdSkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoazEtPnBtdSksCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJmYWlsZWQgdG8gbG9va3VwIFBNVSByZWdpc3RlcnNcbiIp
Owo+PiArCj4+ICvCoMKgwqAgazEtPmxpbmsgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3Vy
Y2VfYnluYW1lKHBkZXYsICJsaW5rIik7Cj4+ICvCoMKgwqAgaWYgKCFrMS0+bGluaykKPiAKPiBp
ZiAoSVNfRVJSKGsxLT5saW5rKSkgPwoKWWVzLCB5b3UncmUgcmlnaHQuICBJJ2xsIGZpeCB0aGlz
IGluIHRoZSBuZXh0IHZlcnNpb24uCgoKPiAKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZf
ZXJyX3Byb2JlKGRldiwgLUVOT01FTSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgImZhaWxlZCB0byBtYXAgXCJsaW5rXCIgcmVnaXN0ZXJzXG4iKTsKPiAKPiBN
ZXNzYWdlIHdpdGggLUVOT01FTSBhcmUgaWdub3JlZCwgc28gYSBkaXJlY3QgcmV0dXJuIC1FTk9N
RU0gaXMgbGVzcyAKPiB2ZXJib3NlIGFuZCB3aWxsIGJoYXZlIHRoZSBzYW1lLiBTZWUgWzFdLgo+
IAo+IEJ1dCBpbiB0aGlzIGNhc2UsIEkgdGhpbmsgaXQgc2hvdWxkIGJlIFBUUl9FUlIoazEtPmxp
bmspLgoKWWVzLCB0aGF0J3Mgd2hhdCBpdCB3aWxsIGJlLgoKPiBbMV06IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE4LXJjMi9zb3VyY2UvZHJpdmVycy9iYXNlLyAKPiBjb3Jl
LmMjTDUwMTUKPiAKPj4gKwo+PiArwqDCoMKgIGsxLT5wY2kuZGV2ID0gZGV2Owo+PiArwqDCoMKg
IGsxLT5wY2kub3BzID0gJmsxX3BjaWVfb3BzOwo+PiArwqDCoMKgIGR3X3BjaWVfY2FwX3NldCgm
azEtPnBjaSwgUkVRX1JFUyk7Cj4+ICsKPj4gK8KgwqDCoCBrMS0+cGNpLnBwLm9wcyA9ICZrMV9w
Y2llX2hvc3Rfb3BzOwo+PiArCj4+ICvCoMKgwqAgLyogSG9sZCB0aGUgUEhZIGluIHJlc2V0IHVu
dGlsIHdlIHN0YXJ0IHRoZSBsaW5rICovCj4+ICvCoMKgwqAgcmVnbWFwX3NldF9iaXRzKGsxLT5w
bXUsIGsxLT5wbXVfb2ZmICsgUENJRV9DTEtfUkVTRVRfQ09OVFJPTCwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgQVBQX0hPTERfUEhZX1JTVCk7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSBkZXZt
X3JlZ3VsYXRvcl9nZXRfZW5hYmxlKGRldiwgInZwY2llM3YzIik7Cj4+ICvCoMKgwqAgaWYgKHJl
dCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZmFpbGVkIHRvIGdldCBc
InZwY2llM3YzXCIgc3VwcGx5XG4iKTsKPj4gKwo+PiArwqDCoMKgIHBtX3J1bnRpbWVfc2V0X2Fj
dGl2ZShkZXYpOwo+PiArwqDCoMKgIHBtX3J1bnRpbWVfbm9fY2FsbGJhY2tzKGRldik7Cj4+ICvC
oMKgwqAgZGV2bV9wbV9ydW50aW1lX2VuYWJsZShkZXYpOwo+PiArCj4+ICvCoMKgwqAgcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgazEpOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gazFfcGNpZV9w
YXJzZV9wb3J0KGsxKTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gcGFyc2Ugcm9vdCBwb3J0XG4i
KTsKPj4gKwo+PiArwqDCoMKgIHJldCA9IGR3X3BjaWVfaG9zdF9pbml0KCZrMS0+cGNpLnBwKTsK
Pj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCByZXQsICJmYWlsZWQgdG8gaW5pdGlhbGl6ZSBob3N0XG4iKTsKPj4gKwo+PiArwqDC
oMKgIHJldHVybiAwOwo+PiArfQo+IAo+IC4uLgo+IAo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgazFfcGNpZV9vZl9tYXRjaF90YWJsZVtdID0gewo+PiArwqDCoMKgIHsgLmNv
bXBhdGlibGUgPSAic3BhY2VtaXQsazEtcGNpZSIsIH0sCj4+ICvCoMKgwqAgeyB9LAo+IAo+IFVu
bmVlZGVkIHRyYWlubGluZyBjb21tYSBhZnRlciBhIHRlcm1pbmF0b3IuCgpVbm5lZWRlZCwgYnV0
IG5vdCBlcnJvbmVvdXMuICBJbiBhbnkgY2FzZSwgSSdsbCBkcm9wIGl0IGJhc2VkCm9uIHlvdXIg
cHJlZmVyZW5jZS4KClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuCgoJCQkJCS1BbGV4Cgo+IAo+
PiArfTsKPj4gKwo+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgazFfcGNpZV9kcml2
ZXIgPSB7Cj4+ICvCoMKgwqAgLnByb2JlwqDCoMKgID0gazFfcGNpZV9wcm9iZSwKPj4gK8KgwqDC
oCAucmVtb3ZlwqDCoMKgID0gazFfcGNpZV9yZW1vdmUsCj4+ICvCoMKgwqAgLmRyaXZlciA9IHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICJzcGFjZW1p
dC1rMS1wY2llIiwKPj4gK8KgwqDCoMKgwqDCoMKgIC5vZl9tYXRjaF90YWJsZcKgwqDCoMKgwqDC
oMKgID0gazFfcGNpZV9vZl9tYXRjaF90YWJsZSwKPj4gK8KgwqDCoMKgwqDCoMKgIC5wcm9iZV90
eXBlwqDCoMKgwqDCoMKgwqAgPSBQUk9CRV9QUkVGRVJfQVNZTkNIUk9OT1VTLAo+PiArwqDCoMKg
IH0sCj4+ICt9Owo+PiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihrMV9wY2llX2RyaXZlcik7Cj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
