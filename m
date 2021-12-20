Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C31C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ac62H13PVqX9N3Vv50x7CuZzelHcyh7W1Rc1udHK5Sg=; b=gefyNbTdrSX21/4LJuFW33IkC7
	CjSwlnsGyyYA/JR1vk2cjKDxxkZq98L1f9kUzDchAY44lBYjymZHVezfzRt8CmJiUFOy5IlrZYezk
	82gjbIlRzVg8qHh1KTFRBUCqY9L5nFUBuf2IPSsLgRjvuQTAhpCqCY9f/XWwqV13X30aOyEOjEn6l
	//hETinqfLrpu6tUsbPOnSpSUa9rF4DbHQacq7F6MBfyiR9iqt+bLQu7uhAI6NFmJhskinVlXez8a
	f6fUtN7ksK1JH0+tVkYO0+2sP+HjKaVU7pIerB+j4ED7drIu1Ckc2juuQ5+h/GyI7BkEWlwuzniL9
	gPyoScvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzHew-002Ezj-LW; Mon, 20 Dec 2021 12:20:54 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzHes-002Ewc-R9
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 12:20:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id e5so19680030wrc.5
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 04:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=np0iAF7uBOz/zMFdzwzXbnF0JId1hkZMqK8uf9ALIPo=;
 b=e+Y7D7VhJuB8FzbA9mQu80q5RuTgA2F348mkBI/YBVNlafZxYknJYMsz1PnTO1BV8t
 lN+whUb3T6NkBqYVLEE421GPp/BhDleTxEPf07pNoHIM31eFUTGngHlQrygp+HHSGGHJ
 559oLKg61zK48HemuxlE8s1nsSOuBDegPTXJ0Ot7kdNYrnwwS1M68VGMaHYmf5Tnxcro
 QTmhLh9axQcuHWo4zITHNhJMeCaX3OkK3RQAgLqIUbdM+IjR8l7aLBUnQuixiJsbcCOM
 6dgiBzB0RE6+XnBewwNK8fNtz7ZWV2+XJMCwSfP7I1Ni+ItxdmVrVXtoN9xRB9XQ5dUg
 QEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=np0iAF7uBOz/zMFdzwzXbnF0JId1hkZMqK8uf9ALIPo=;
 b=y8wXQz1paz2OTXBXrf3DRl2w2CSEX1G4FhWI55DqjE6cEqdCfwoixaodOAbcCPt5ul
 3DurlXSVgkKkHxx3WltHLtsZgDsng6uXkXp6lFhWn52MIM8cIApiPfNMZLhTYLqlkXQ2
 DID2qoltu9TKpRNyUpZRPYMh1JgQUWfYSQ8qNuc2xQFYBoLQ0obWg7fvklHFb5jb3MdJ
 3xxrfTqw+wgL3O+uwiZmuf+wKM4aztf3lCjxBj62Mo6popvzmxBsMqKT9KoxnqFIU1Sy
 8XxW2dC7ujOYzBmtNG5Ch2VgS9B0cnmZ8QMIfw0c2r1gCEINEfvSVtMA83jZaH/cPt+D
 KkJQ==
X-Gm-Message-State: AOAM5325TBwBSvG5rvwqLLolr+eNfuQfnVpIwXx+9GclqjxFj9/DZFck
 JDJl6x4R412DPiVjjD8rKIkXvokRbTD0aA==
X-Google-Smtp-Source: ABdhPJzyF18YnzOr+hj7VOs/q8njpqgaCxU63zghUvfAjBhUjUCqQw3xNQhCk3qEv23tbtEXA3hf4Q==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr12508513wrr.177.1640002848679; 
 Mon, 20 Dec 2021 04:20:48 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ac6:da31:b84c:183?
 ([2a01:e34:ed2f:f020:ac6:da31:b84c:183])
 by smtp.googlemail.com with ESMTPSA id o4sm13712888wmc.43.2021.12.20.04.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 04:20:48 -0800 (PST)
Subject: Re: [PATCH v2 0/2] dt-bindings: timer: sifive,clint: Miscellaneous
 improvements
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1639662093.git.geert@linux-m68k.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <88170fb7-f348-1227-cf8c-863306986917@linaro.org>
Date: Mon, 20 Dec 2021 13:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cover.1639662093.git.geert@linux-m68k.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_042050_944933_2C56CDBD 
X-CRM114-Status: GOOD (  13.89  )
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

T24gMTYvMTIvMjAyMSAxNDo0MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IAlIaSBhbGws
Cj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMgY29udGFpbnMgdHdvIGltcHJvdmVtZW50cyBmb3IgdGhl
IFNpRml2ZSBQTElDIERUCj4gYmluZGluZ3MuCj4gCj4gQ2hhbmdlcyBjb21wYXJlZCB0byB2MVsx
XToKPiAgIC0gU3BsaXQgaW4gdHdvIHBhdGNoZXMsCj4gICAtIEltcHJvdmUgcGF0Y2ggZGVzY3Jp
cHRpb24gYW5kIGRvY3VtZW50IGxpbWl0IHJhdGlvbmFsZS4KPiAKPiBUaGFua3MhCj4gCj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTExMjUxNTIzMTcuMTYyOTU4LTEtZ2VlcnRA
bGludXgtbTY4ay5vcmcKPiAKPiBHZWVydCBVeXR0ZXJob2V2ZW4gKDIpOgo+ICAgZHQtYmluZGlu
Z3M6IHRpbWVyOiBzaWZpdmUsY2xpbnQ6IEZpeCBudW1iZXIgb2YgaW50ZXJydXB0cwo+ICAgZHQt
YmluZGluZ3M6IHRpbWVyOiBzaWZpdmUsY2xpbnQ6IEdyb3VwIGludGVycnVwdCB0dXBsZXMKPiAK
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgICAgICAg
ICAgfCA5ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKUGxlYXNlIHJlc2VuZCB0aGUgdGltZXIgYmluZGluZ3MgY2hhbmdlcywgdGhl
IEdQVSBhbmQgTkFORCBjb250cm9sbGVyCnNlcmllcyBhcmUgY29uZnVzaW5nIHRoZSBiNCB0b29s
cwoKVGhhbmtzCgogIC0tIERhbmllbAoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGlu
YXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8
aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
