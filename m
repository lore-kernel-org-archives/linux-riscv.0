Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBB9C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 12:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E02B2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 12:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ulguvBy4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="KxR7qqTe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E02B2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deMfYVzG0Ju+x2QfjX6dxWxW4BBTyKS5tC8CNupR6uY=; b=ulguvBy4Ur578n
	15QGMxEjNfBhRzNeGcmsTCfQl1C+LJw7JHDXkkgpHNN/tIPBneNgeoh71P3fXfRP6EUew2eK0qAiX
	lvRyYie2NF/SUJDLJIDl0ew/Q7OHpLR2hECDQ8IEPuN7KATTwE6XQFxCWmoTFlnZ2ipBk8FlENmVV
	Ody4pbo1xuPvfP7IV3nABoYhQ4sQFde8kJmP3eK4Y7+BLtvBXgfxOlqrwF4kqg97n+7okjbI+A+tJ
	/dIqlGa2+9BU2MSVwZjf5Td89W1JZuT6L3rJvgHIgsgvWtWlNjdt7WCKoapQY0BMCqvGbdopCdMdM
	r3ROowgZz/sGvwa2h6iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTnou-0008Pb-L9; Mon, 03 Dec 2018 12:59:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTnor-0008OX-4a
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 12:59:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id x10so12063022wrs.8
 for <linux-riscv@lists.infradead.org>; Mon, 03 Dec 2018 04:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oznX/kWjvnBF6iJxy125LWHVTKyXkJdryOV7MUn29P8=;
 b=KxR7qqTeZb8jgfT6jR2QNWBlel4j69NR7E/WhwvcnDZNLJi5o9C3EUSgI2SVfDjcvv
 y+ulkX1Fh0NAoi/nADkn0A5pyuQ/Htezo1iuNHfPtYCrfHDXCLhEASHwBWxCGid1GoNO
 s1dPtyhLz2eNHM/SmvA+yS0akgyswe2PceLSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oznX/kWjvnBF6iJxy125LWHVTKyXkJdryOV7MUn29P8=;
 b=o96xx+7Giz9c+SU9jFoqALEFYlHc4LOKtL83mYV+zopFkbGYSY0IoPqD0/WyKSTHGw
 vfON6A5yUovyLZnAKrvUql+YkSj2k2x5kOjNJBE1azCW+AbJr7dutuK9yQs8BRYOBINl
 aDFptM2/gngXFGr5g2fCd0AkCB6WHwftMG/m1bYrMRWOfG0ldE+RQ33sKvlnoLyGgc+J
 aGGxNU7X2OxNlov6Vva68GRpJcxDFi2PBeCz0XuhUg2B+ZtDrJOYgBHt+pO1W6EoA7ko
 mdukG65QgxAnotO5UU9i1+gqh5N2rxf4dz/d/7DF+ZHY6YYrPt1ERAKoU7jGHCyex9pF
 KEJQ==
X-Gm-Message-State: AA+aEWZRAmeaCWfNJiMwQ1SIJY7bp86X5m8Q8DpuUc15G9ULojAWQxAD
 D1DpxekglXKKMYNP+L5DJS6Xa/KuDOA=
X-Google-Smtp-Source: AFSGD/XsE7g2YVjF/B+VbNrY6Pp7anbqj5CRbctuDT5n3Ih6RTmpiMW7rkP2BUJp8RhhzaELc7S8XQ==
X-Received: by 2002:adf:f785:: with SMTP id q5mr14892076wrp.9.1543841951065;
 Mon, 03 Dec 2018 04:59:11 -0800 (PST)
Received: from [192.168.0.40] (sju31-1-78-210-255-2.fbx.proxad.net.
 [78.210.255.2])
 by smtp.googlemail.com with ESMTPSA id g67sm14717299wmd.38.2018.12.03.04.59.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 04:59:10 -0800 (PST)
Subject: Re: [PATCH] clocksource: riscv_timer: Provide sched_clock
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20181203123524.11778-1-anup@brainfault.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c970d873-9dbc-9f21-3380-89635d6f574a@linaro.org>
Date: Mon, 3 Dec 2018 13:59:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181203123524.11778-1-anup@brainfault.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_045925_179656_329FAB3D 
X-CRM114-Status: GOOD (  16.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMvMTIvMjAxOCAxMzozNSwgQW51cCBQYXRlbCB3cm90ZToKPiBDdXJyZW50bHksIHdlIGRv
bid0IGhhdmUgYSBzY2hlZF9jbG9jayByZWdpc3RlcmVkIGZvciBSSVNDLVYgc3lzdGVtcy4KPiBU
aGlzIG1lYW5zIExpbnV4IHRpbWUga2VlcGluZyB3aWxsIHVzZSBqaWZmaWVzIChydW5uaW5nIGF0
IEhaKSBhcyB0aGUKPiBkZWZhdWx0IHNjaGVkX2Nsb2NrLgo+IAo+IFRvIGF2b2lkIHRoaXMsIHdl
IGV4cGxpY2l0eSBwcm92aWRlIHNjaGVkX2Nsb2NrIHVzaW5nIFJJU0MtViByZHRpbWUKPiBpbnN0
cnVjdGlvbiAoc2ltaWxhciB0byByaXNjdl90aW1lciBjbG9ja3NvdXJjZSkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkhpIEFudXAsCgp0aGUg
R0VORVJJQ19TQ0hFRF9DTE9DSyBkZXBlbmRlbmN5IGluIHRoZSBLY29uZmlnIGlzIG1pc3Npbmcu
CgpUaGFua3MKCj4gLS0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvcmlzY3ZfdGltZXIuYyB8IDkg
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS9yaXNjdl90aW1lci5jIGIvZHJpdmVycy9jbG9ja3Nv
dXJjZS9yaXNjdl90aW1lci5jCj4gaW5kZXggMDg0ZTk3ZGMxMGVkLi40MzE4OTIyMDBhMDggMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9yaXNjdl90aW1lci5jCj4gKysrIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS9yaXNjdl90aW1lci5jCj4gQEAgLTgsNiArOCw3IEBACj4gICNpbmNs
dWRlIDxsaW51eC9jcHUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9pcnEuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkX2Nsb2NrLmg+Cj4gICNpbmNs
dWRlIDxhc20vc21wLmg+Cj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gIAo+IEBAIC00OSw2ICs1
MCwxMSBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBsb25nIHJpc2N2X2Nsb2Nrc291cmNlX3JkdGlt
ZShzdHJ1Y3QgY2xvY2tzb3VyY2UgKmNzKQo+ICAJcmV0dXJuIGdldF9jeWNsZXM2NCgpOwo+ICB9
Cj4gIAo+ICtzdGF0aWMgdTY0IHJpc2N2X3NjaGVkX2Nsb2NrKHZvaWQpCj4gK3sKPiArCXJldHVy
biBnZXRfY3ljbGVzNjQoKTsKPiArfQo+ICsKPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVj
dCBjbG9ja3NvdXJjZSwgcmlzY3ZfY2xvY2tzb3VyY2UpID0gewo+ICAJLm5hbWUJCT0gInJpc2N2
X2Nsb2Nrc291cmNlIiwKPiAgCS5yYXRpbmcJCT0gMzAwLAo+IEBAIC05Nyw2ICsxMDMsOSBAQCBz
dGF0aWMgaW50IF9faW5pdCByaXNjdl90aW1lcl9pbml0X2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bikKPiAgCWNzID0gcGVyX2NwdV9wdHIoJnJpc2N2X2Nsb2Nrc291cmNlLCBjcHVpZCk7Cj4gIAlj
bG9ja3NvdXJjZV9yZWdpc3Rlcl9oeihjcywgcmlzY3ZfdGltZWJhc2UpOwo+ICAKPiArCXNjaGVk
X2Nsb2NrX3JlZ2lzdGVyKHJpc2N2X3NjaGVkX2Nsb2NrLAo+ICsJCQlCSVRTX1BFUl9MT05HLCBy
aXNjdl90aW1lYmFzZSk7Cj4gKwo+ICAJZXJyb3IgPSBjcHVocF9zZXR1cF9zdGF0ZShDUFVIUF9B
UF9SSVNDVl9USU1FUl9TVEFSVElORywKPiAgCQkJICJjbG9ja2V2ZW50cy9yaXNjdi90aW1lcjpz
dGFydGluZyIsCj4gIAkJCSByaXNjdl90aW1lcl9zdGFydGluZ19jcHUsIHJpc2N2X3RpbWVyX2R5
aW5nX2NwdSk7Cj4gCgoKLS0gCiA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0
dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3
aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcv
bGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
