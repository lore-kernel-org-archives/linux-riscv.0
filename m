Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7E9C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 06:04:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB91613AB
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 06:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB91613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O7pFUWtbqTh1r65XGY1cB3G3lttZvMvBY5j4EalwfCU=; b=eTyhOy7i0crvTvBs1CpB58huM
	JgzPb5xPoAPedB+Gjx5SxRzG+GvABHmkuBP67rHI33rtVYtEGoV3jDiHQfsecB/cVKUvgpwRmU4v3
	doSd/T8KnI1Wme1o3hEbzNvy2XWix3vIqSMUVycAw+CmgoL0N7RLhDtcouMZF4NiB0MlrSg9IGBEA
	iLNe/K7DKvNVSu5I8nSlMFFBfChqjAr9BDgRBb2rPMqJJs757IYDucK0fl5WsutS3IFG3zxDBXPvo
	y2qKckXwx+uXc86rsWqShyFiY2ZZATPSXQhRZwOlYIcI9XA8u7JPaAj2AQ2VB6bmqV0U4WcDmSR3q
	GHI4hKdZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZovU-000nmY-Qr; Fri, 23 Apr 2021 06:04:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZotE-000nG3-4p
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 06:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=zXbbkPjngrwljOT9VBaO179g4Z8CpNvhyukw5pJMEf0=; b=S2ltPy4KINOVrO5xAYI2iJFSqN
 X1wy0qTdzZzW7Z2u40pO1SYwnmadugcNdv6RqX/RUZ/wAHFVr7obfdBUU2MIOf+h0u0hWyzxuz3hw
 CVMwosyK58FsasWMAKmAgkdNBVSv4C9SwqLo0CGlMPItq7NCwgnuYHKDzfy5hIcpGc4hDvAVMSgrl
 LsU0HBW2wD/YrEjDxfTb8OF3s3109adimlDNWe5raCPWSjZZqpsN/p1NyrvjH/D6pgPHGELQ9YxhR
 uAPkMulm4o0fFnzOTAidzyf5nOerbxPpJFKmJKYsbcnjjPjrAsDN+ct67cbScgb772TDb6oCee7Ik
 VQ3rre4Q==;
Received: from mail-qk1-f182.google.com ([209.85.222.182])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZotA-00EAf1-U6
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 06:02:06 +0000
Received: by mail-qk1-f182.google.com with SMTP id 8so14957413qkv.8
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 23:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zXbbkPjngrwljOT9VBaO179g4Z8CpNvhyukw5pJMEf0=;
 b=BqdKfnE5gTr+IxYA68kgxtp8xgIJSs7HUX2G3Y34vJIVSoXZN2vZmr6SNfY+NsAt1h
 6Z9FVzW23v+UsE17nbBevDS9LDj/xIbWUkovFe2AzWgqRGtH/OjA+UDKf9uakinnVDDk
 G/iVLPApwJ4jyyKHYnakYqvsctBy2LZ61ZdIhkaZVUc8I+dQV4gCxrK1t70gH1gbUoEx
 NkIz+tFnXRFigV+00b3g6qfo3EuYVY8HHW0lJVrbNwhrA/jNVsqhUWl25t9I5cj+GNc3
 QqyROXdy2MHkeh99ox3Xto2yCZQuiwJdjqj/BTGQtOPv+Cf0zOId1NDQkH1mjGWj2m4L
 EUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zXbbkPjngrwljOT9VBaO179g4Z8CpNvhyukw5pJMEf0=;
 b=Pm2Gp8etiWsVVSfeqiv87vFqF26j48HU46D5a+1ww+qifzAgaCWroljHbCyh1+4kon
 eM+9G3PLWZwaduY8fBI3vVmYXM8/Dta6rVgxPcfyOQenvKOGG+OFNGHpieyR/6zZCkwE
 /YTmN1V74pYZaPwgd2d3xWdPXIuPDNNuNNjT8lDqZAbJ1AjvFfXQ+TDSrMhXejG6d5W5
 GRkmehzdvZtccsSW5Gqa2Oj4tlOD8fmESDDx7ZGyecnqS3EHcmGqG1fDLxkzM22x0Gb6
 4NEjVgpZsjEupsKSjpE3XoOxi9JUE+NcaDjr7ZpTy5TqTN1H+UsXqs/EYkuQimbrMKuH
 qM9w==
X-Gm-Message-State: AOAM531UZAbppjmTVvOwxm9kHt5Aswk41sJO+pAVvMbLXu+qdsICScBk
 rcL9wyZcIBfeio9FFcM3W3agFsVcJuEstpkxrTTn4A==
X-Google-Smtp-Source: ABdhPJwxX/DyEHtnoolCQBXwRfYcutuh7B7+vAQpk+myjOKhbp7t59COpYccNOY5D1ZYJJzQQyB3SuCxC0y+8qAqRwg=
X-Received: by 2002:a37:c41:: with SMTP id 62mr2529779qkm.66.1619157658130;
 Thu, 22 Apr 2021 23:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-f3dd2202-8d2b-4e17-9067-c4521aac8125@palmerdabbelt-glaptop>
 <mhng-41850660-4a95-462a-9b1e-33dfc67815a4@palmerdabbelt-glaptop>
In-Reply-To: <mhng-41850660-4a95-462a-9b1e-33dfc67815a4@palmerdabbelt-glaptop>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Fri, 23 Apr 2021 14:00:46 +0800
Message-ID: <CAHCEehJHZGEUy2TO6fPg1WyAbQCoVee=AcRrkZE4Zhw+ibYKqQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, jh80.chung@samsung.com, 
 Zong Li <zong.li@sifive.com>, robh+dt@kernel.org, vidyas@nvidia.com, 
 alex.dewar90@gmail.com, Erik Danie <erik.danie@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Turquette <mturquette@baylibre.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stephen Boyd <sboyd@kernel.org>, hayashi.kunihiko@socionext.com, hes@sifive.com,
 khilman@baylibre.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>,
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_230205_031379_B57C47C4 
X-CRM114-Status: GOOD (  25.11  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4g5pa8IDIwMjHlubQ05pyIMjPml6Ug
6YCx5LqUIOS4i+WNiDE6MTDlr6vpgZPvvJoKPgo+IE9uIFRodSwgMjIgQXByIDIwMjEgMjE6NDM6
MDMgUERUICgtMDcwMCksIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4gT24gU3VuLCAxMSBBcHIg
MjAyMSAxOTozNzo1MCBQRFQgKC0wNzAwKSwgZ3JlZW50aW1lLmh1QHNpZml2ZS5jb20gd3JvdGU6
Cj4gPj4gTG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+IOaWvCAy
MDIx5bm0NOaciDnml6Ug6YCx5LqUIOS4i+WNiDQ6NTTlr6vpgZPvvJoKPiA+Pj4KPiA+Pj4gT24g
VHVlLCA2IEFwciAyMDIxIDE3OjI2OjI4ICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6Cj4gPj4+
ID4gVGhpcyBwYXRjaHNldCBpbmNsdWRlcyBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xs
ZXIgZHJpdmVyLiBXZSBhbHNvCj4gPj4+ID4gYWRkIHBjaWVfYXV4IGNsb2NrIGFuZCBwY2llX3Bv
d2VyX29uX3Jlc2V0IGNvbnRyb2xsZXIgdG8gcHJjaSBkcml2ZXIgZm9yCj4gPj4+ID4gUENJZSBk
cml2ZXIgdG8gdXNlIGl0Lgo+ID4+PiA+Cj4gPj4+ID4gVGhpcyBpcyB0ZXN0ZWQgd2l0aCBlMTAw
MGU6IEludGVsKFIpIFBSTy8xMDAwIE5ldHdvcmsgQ2FyZCwgQU1EIFJhZGVvbiBSNQo+ID4+PiA+
IDIzMCBncmFwaGljcyBjYXJkIGFuZCBTUCBNLjIgUENJZSBHZW4gMyBTU0QgaW4gU2lGaXZlIFVu
bWF0Y2hlZCBiYXNlZCBvbgo+ID4+PiA+IHY1LjExIExpbnV4IGtlcm5lbC4KPiA+Pj4gPgo+ID4+
PiA+IFsuLi5dCj4gPj4+Cj4gPj4+IEFwcGxpZWQgdG8gcGNpL2R3YyBbZHJvcHBlZCBwYXRjaCA2
XSwgdGhhbmtzIQo+ID4+Pgo+ID4+PiBbMS82XSBjbGs6IHNpZml2ZTogQWRkIHBjaWVfYXV4IGNs
b2NrIGluIHByY2kgZHJpdmVyIGZvciBQQ0llIGRyaXZlcgo+ID4+PiAgICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2xwaWVyYWxpc2kvcGNpL2MvZjNjZTU5M2IxYQo+ID4+PiBbMi82XSBjbGs6
IHNpZml2ZTogVXNlIHJlc2V0LXNpbXBsZSBpbiBwcmNpIGRyaXZlciBmb3IgUENJZSBkcml2ZXIK
PiA+Pj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jLzBhNzhm
Y2ZkM2QKPiA+Pj4gWzMvNl0gTUFJTlRBSU5FUlM6IEFkZCBtYWludGFpbmVycyBmb3IgU2lGaXZl
IEZVNzQwIFBDSWUgZHJpdmVyCj4gPj4+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbHBp
ZXJhbGlzaS9wY2kvYy84YmIxYzY2YTkwCj4gPj4+IFs0LzZdIGR0LWJpbmRpbmdzOiBQQ0k6IEFk
ZCBTaUZpdmUgRlU3NDAgUENJZSBob3N0IGNvbnRyb2xsZXIKPiA+Pj4gICAgICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jL2I4NmQ1NWMxMDcKPiA+Pj4gWzUvNl0gUENJ
OiBmdTc0MDogQWRkIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlciBkcml2ZXIKPiA+
Pj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9scGllcmFsaXNpL3BjaS9jLzMyN2MzMzNh
NzkKPiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+PiBMb3JlbnpvCj4gPj4KPiA+PiBIaSBQYWxtZXIs
Cj4gPj4KPiA+PiBTaW5jZSB0aGUgUENJRSBkcml2ZXIgaGFzIGJlZW4gYXBwbGllZCwgd291bGQg
eW91IHBsZWFzZSBwaWNrIHBhdGNoIDYKPiA+PiB0byBSSVNDLVYgZm9yLW5leHQgdHJlZT8KPiA+
PiBUaGFuayB5b3UuIDopCj4gPgo+ID4gU29ycnksIEkgZ290IHRoaXMgY29uZnVzZWQgYmV0d2Vl
biB0aGUgTGludXggcGF0Y2ggc2V0IGFuZCB0aGUgdS1ib290Cj4gPiBwYXRjaCBzZXQgc28gSSB0
aG91Z2h0IG1vcmUgdmVyc2lvbnMgb2YgdGhpcyBoYWQga2VwdCBjb21taW5nLiAgVGhlIERUCj4g
PiBpcyBvbiBmb3ItbmV4dCBub3cuCj4KPiBJIHNwb2tlIHRvbyBzb29uOiB0aGlzIGFjdHVhbGx5
IGRvc24ndCBldmVuIGJ1aWxkIGZvciBtZS4gIEl0J3MgdGhlCj4gImNsb2NrcyA9IDwmcHJjaSBQ
UkNJX0NMS19QQ0lFX0FVWD47IiBsaW5lCj4KPiAgICAgRXJyb3I6IGFyY2gvcmlzY3YvYm9vdC9k
dHMvc2lmaXZlL2Z1NzQwLWMwMDAuZHRzaTozMTkuMjAtMjEgc3ludGF4IGVycm9yCj4gICAgIEZB
VEFMIEVSUk9SOiBVbmFibGUgdG8gcGFyc2UgaW5wdXQgdHJlZQo+ICAgICBtYWtlWzJdOiAqKiog
W3NjcmlwdHMvTWFrZWZpbGUubGliOjMzNjogYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlm
aXZlLXVubWF0Y2hlZC1hMDAuZHRiXSBFcnJvciAxCj4gICAgIG1ha2VbMV06ICoqKiBbc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDo1MTQ6IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlXSBFcnJvciAy
Cj4gICAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6MTM4ODogZHRic10gRXJyb3IgMgo+ICAgICBtYWtl
OiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+Cj4gSSdtIG5vdCBzdXJlIHdo
YXQgdGhlIGlzc3VlIGlzLCBJIHNlZSBhbiBhbmNob3IgZm9yICJwcmNpIi4gIERvIHlvdSBtaW5k
Cj4gc2VuZGluZyBhbG9uZyBhIG5ldyB2ZXJzaW9uIHRoYXQgY29tcGlsZXMgb24gdG9wIG9mIGZv
ci1uZXh0PyAgSWYgSSBuZWVkCj4gdGhlIGRlZmluaXRvbiBvZiBQUkNJX0NMS19QQ0lFX0FVWCBm
cm9tIGEgUENJZSB0cmVlIHRoZW4gaXQncyBwcm9iYWJseQo+IGJlc3QgdG8ganVzdCBrZWVwIHRo
ZSBEVFMgYWxvbmcgd2l0aCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcy4gIElJUkMgSQo+IGFscmVk
eSBBY2tlZCBpdCwgYnV0IGp1c3QgdG8gYmUgY2xlYXIKPgo+IEFja2VkLWJ5OiBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Cj4gVGhhbmtzIQoKVGhhbmsgeW91LCBQ
YWxtZXIuCkl0IGlzIGRlZmluZWQgaW4gdGhlIGZpcnN0IGNvbW1pdCBvZiB0aGlzIHBhdGNoc2V0
LiAiY2xrOiBzaWZpdmU6IEFkZApwY2llX2F1eCBjbG9jayBpbiBwcmNpIGRyaXZlciBmb3IgUENJ
ZSBkcml2ZXIiCllvdSBjYW4gc2VsZWN0IHRoZXNlIHdob2xlIDYgcGF0Y2hlcyB0byBtYWtlIHN1
cmUgaXQgY2FuIGJlIGJ1aWx0LgoKSGkgTG9yZW56bywKV291bGQgeW91IG1pbmQgdG8gcGljayB0
aGUgNnRoIHBhdGNoIGFsb25nIHdpdGggdGhlIG90aGVyIDUgcGF0Y2hlcz8KVGhhbmsgeW91LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
