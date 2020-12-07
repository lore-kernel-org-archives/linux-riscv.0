Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A51C4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 20:35:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A121D23406
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 20:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A121D23406
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R0slSoM/yIgcdwcBGvz/mfum/8YVFRH6ID3knXSf1mc=; b=yJHaVzHsHIKOoi1nYxa3rrS3l
	9DubYBVD0/ofQketqRFvpD/4QxDOC4+WFTvfjGMIYtvFM3tG4tEIGrLMmfwcBAT2htiNKww5meqvk
	T4jp3ijDqMCn4ashtZBX3BzvAMorOQCHgH1bVnRb0lcRGE2d8pnMnU5mBpQPEkiUxTOhXHYgba7t9
	yRCB71t8sCmS4QRKO6y2HWmO59tEdc6uAN87KiZB2j/zfD2MRde2y/AxIFUEeQ8/J29J/u+j3z8Bh
	AvNNxHMJd0gkcmwuwT8QSh1vD5knT01eEpCAO5bIsl+DZtW0ymcAE6f7mkyDQPo3rV6yMMpTDzdoz
	NV4L709YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmNDy-00072Y-DN; Mon, 07 Dec 2020 20:35:10 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmNDu-00071b-N5
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 20:35:07 +0000
Received: from [192.168.1.155] ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mum6l-1jvEXL33ml-00rn89; Mon, 07 Dec 2020 21:34:56 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
 <20201206075131-mutt-send-email-mst@kernel.org>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <dadc99c5-dd63-9b3e-aa00-c9dc0b622134@metux.net>
Date: Mon, 7 Dec 2020 21:34:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201206075131-mutt-send-email-mst@kernel.org>
Content-Language: tl
X-Provags-ID: V03:K1:hbxWK5NoTU1gQ95fGH3BMY4QAmnZBlvFnu9xed6dReXqGP9zoef
 MckleM1vV7HliBSRZ6udkFDg4oyUKSNbZwul7Y66weAy+oon65LCWdmf+dxfK6r3WTQNoS4
 h3/cDg6RD1w561g9mrzJSlidlzrboqRUVJhpHVuHlrVchpYU/bfHn/az49skSDmMNfUtWjr
 zd0PBJPpX1GrxPAxwHQmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a1HG/QGb8tY=:0q0pD8h55NgouMf6dv3JD2
 Cmx7N9LkvLMDbG6kymexPbp1HKRzx7Rorroj2ZlFUcC7DgJUW/cKzL/tB4CyNoE0tfadzvgWR
 bKZcQEkxGiiiXDLxGxZN31wPYHCpJE3AnuMMRqhHMlRbsY7l9Gw4vYhc2Z5xyIVpb4d7TX8ar
 lBAAh6lHX5wJL44SeNWREbvfTDEkT8JE0A7/FGxY0QMVapvLqU+tUnES7VA7OVAL/BMcBsZAR
 mUfUnQC5YTSsKej0IiwPX5L7/EhgLUAoJufCr5ePB6QiYs0//YTjXBmuTkPRZ9iMf2WA5LiKE
 EWc75DMdfsNl2sI5I1wAmNtpnkJ7Eh+BIiQNXpFYikpjA2IcRQDXbwBkOmf7j4zJPg4vp0ZmI
 skM9M1UncysVw4xvpgNJA3M80NZgL50I41KvIF5I0T9ArXakC5fAvYc4NfJVv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_153507_011628_5746ED0A 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: stefanha@redhat.com, corbet@lwn.net, Jason Wang <jasowang@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, msuchanek@suse.de,
 "Enrico Weigelt, metux IT consult" <info@metux.net>, linus.walleij@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcuMTIuMjAgMTQ6NTIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKCj4+IFNlZSBhYm92
ZTogTkFLLiBiZWNhdXNlIGl0IGNhbid0IGV2ZW4gYmUgZW5hYmxlZCBkaXJlY3RseSAoYnkgdGhl
IHVzZXIpLgo+PiBJZiBpdCB3YXNuJ3QgbWVhbnQgb3RoZXJ3aXNlLCB3ZSdkIGhhdmUgdG8gYWRk
IGFuIG1lbnUgdGV4dC4KPiAKPiBUaGUgcG9pbnQgaXMgdGhhdCB1c2VyIGVuYWJsZXMgb25lIG9m
IHRoZSBiaW5kaW5ncy4KPiBUaGF0IGluIHR1cm4gZW5hYmxlcyBkcml2ZXJzLiBJZiB3ZSBtZXJl
bHkgc2VsZWN0IFZJUlRJTwo+IHRoZXJlJ3MgYSBjaGFuY2UgdXNlciB3b24ndCByZW1lbWJlciB0
byBzZWxlY3QgYW55IGJpbmRpbmdzCj4gYW5kIHdpbGwgYmUgc3VycHJpc2VkIG5vdCB0byBzZWUg
YW55IGRldmljZXMuCgpOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5ICJiaW5kaW5ncyIgLi4uIHRy
YW5zcG9ydHMgPwoKSU1ITywgdHJhbnNwb3J0cyBhbmQgZGV2aWNlIGRyaXZlcnMgYXJlIGVudGly
ZWx5IG9ydGhvZ29uYWwuIEJvdGggKnVzZSoKdGhlIGNvcmUsIGJ1dCBJIGRvbid0IHRoaW5rIHRo
ZXkgc2hhbGwgb25seSBzaG93IHVwLCBhZnRlciB0aGUgY29yZSB3YXMKZW5hYmxlZCBleHBsaWNp
dGx5LiBBbnkgY29tYmluYXRpb24gb2YgdHJhbnNwb3J0cyBpcyB2YWxpZCAoaGF2aW5nIG5vbmUK
YXQgYWxsLCBvZiBjb3Vyc2UsIGlzbid0IGFjdHVhbGx5IHVzZWZ1bCkuCgo+PiBXaGVuIHVzaW5n
IG90aGVyIHRyYW5zcG9ydHMgPwo+IAo+IEFueSB0cmFuc3BvcnQgc2VsZWN0cyBWSVJUSU8gc28g
aWYgeW91IGVuYWJsZSB0aGF0LCB5b3UgZ2V0Cj4gVklSVElPIGFuZCB0aHVzIGl0J3MgZW5vdWdo
IHRvIGRlcGVuZCBvbiBpdC4KClRoZSBjb21iaW5hdGlvbiBvZiAnc2VsZWN0IFZJUlRJTycgYW5k
ICdkZXBlbmRzIG9uIFZJUlRJTycgaXMgd2hhdApjYXVzZWQgdGhlIHJlY3Vyc2l2ZSBkZXBlbmRl
bmN5LiBDaGFuaW5nIGV2ZXJ5dGhpbmcgdG8gJ3NlbGVjdCBWSVJUSU8nCmZpeGVkIHRoYXQuCgo+
PiBJIGRvbid0IHRoaW5rdCB0aGF0IHdvdWxkIGJlIGdvb2QgLSBpbnN0ZWFkIGV2ZXJ5Ym9keSBz
aG91bGQganVzdCBzZWxlY3QKPj4gVklSVElPLCBuZXZlciBkZXBlbmQgb24gaXQgKG1heWJlIGRl
cGVuZCBvbiBWSVJUSU9fTUVOVSBpbnN0ZWFkKQo+IAo+IEdQVSBkZXBlbmRzIG9uIFZJUlRJTyBh
bmQgb24gVklSVElPX01FTlUgLi4uIHdoaWNoIHNlZW1zIGV2ZW4gbWVzc2llcgo+IC4uLgoKU2Vl
OgpodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcvbXNnMjQwNDg3MS5odG1sCgoKLS1tdHgKCi0tIAotLS0KSGlud2VpczogdW52ZXJzY2hsw7xz
c2VsdGUgRS1NYWlscyBrw7ZubmVuIGxlaWNodCBhYmdlaMO2cnQgdW5kIG1hbmlwdWxpZXJ0Cndl
cmRlbiAhIEbDvHIgZWluZSB2ZXJ0cmF1bGljaGUgS29tbXVuaWthdGlvbiBzZW5kZW4gU2llIGJp
dHRlIGlocmVuCkdQRy9QR1AtU2NobMO8c3NlbCB6dS4KLS0tCkVucmljbyBXZWlnZWx0LCBtZXR1
eCBJVCBjb25zdWx0CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5n
CmluZm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
