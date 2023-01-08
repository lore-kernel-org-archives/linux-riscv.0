Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5128C54EBC
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCJeynokbghrrGno/eMEpcJkmXiWzey7qhNUjoi++sM=; b=z2l/DYp+7QKPtS
	iU/pq4F8EA9ft46HYZuWKPbIr49dMzb11rfHs27+odh1CDlf0NHXRgrStarvttafF4e1d/oc3DMB3
	qGBoI+2NFdK97UWT0grBbZ+c5AiAwS1MKBkicheRz+pyTa3hvylbhRURK7Mom6w5ETfJLaCIHwcoT
	yAWhAFRZKfjDX83aij3dfnQTWM3ISpjnKwvW9/hl2Htxfzu9muiCpbgkzYRSI4w6He2JMiYiGREys
	EFZnkdjLjB0vAODAJQadVEVkDV4TaNBmhJndyCFZxxkWKTiFVoaAhXEBd/5OnmvaPMBa7kqsmLZ7A
	3Aw7UM2F25RYVcNfkYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEcsh-00Fn5Y-08; Sun, 08 Jan 2023 21:07:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEcsU-00Fn0N-IX; Sun, 08 Jan 2023 21:06:51 +0000
Received: by mail-ej1-x62e.google.com with SMTP id cf18so9270004ejb.5;
        Sun, 08 Jan 2023 13:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqsPmxN00edrHGi0cQNfG1ZlbY68R6DFWjN9C23HMdo=;
        b=VLyhUT2siNF/GSpeQqo7AyhTHW46LJ63JExQJ9DPEjLKXoAnnbjmcx/ecVZO9VXvhX
         nmQQ82mcK28Fl39xCf6NLwKIEcdwiX75riNMwp08TbxTa1mU4VGxa1xt2+Nhyv5+MCv2
         Hc+xIurh3N1XZg0G/o47EnAp3vHlsFZDvdD+bXChWkv8KHoj4sWQWEYHft2h0AlnLm0E
         jlwvhMGiGD6YkXESMqqe0dtAN82zEKXACnXgbB0WC4w/gRLBcZHpKASu3bTlIzSZJkDX
         B+mwq+pPR345I7H3/1Oyh6lJ5YB6XiicQ5Z9Y+4vXMjVII5wq8qZQQ0Sx2jQ8BS34IVF
         PP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqsPmxN00edrHGi0cQNfG1ZlbY68R6DFWjN9C23HMdo=;
        b=3H3qxQyuTip/8mrwuZNnQuCgu0cLa98ym45L4fkB4nqJ321kCzCGTHTWPbG1yxTRT5
         Jl2/tUTC/OmReEc9pnH7sZwUOVFx/4TYjjI3tw762t5bv6iwU+BNxi2LqDMIcaVgvosC
         BBWkyNK7AYXGBMt6318CGKNqsbWqICXZMGgERXGbEhc+QHPShcH88qExY3tIFmMv5Fwp
         WzppFmvDJNIQQzw49h7iinpQjwYwrz0bNJszA3U+J55vPfmS2wdEuJwkRtat1Xn/sQz8
         yauIlyGlsAHPjMA8Kd3Q8qO1uXSK3u/WBFz1tdt1GE4aEUPfL1ASN/BT8zmbY23rfRpw
         ANXQ==
X-Gm-Message-State: AFqh2kpIht30d9jAjWrgaNAEhjrpHSAWYmCW9bNEy8ddS/FPwQuBCrhP
	2nPw5zdt018T7hjHIqo0KA4=
X-Google-Smtp-Source: AMrXdXuvFsQDJJdexEZkEdb0clbew5BO+rs+TUYwxrWPyE3UnE9MdiC0wJkhwmAFYA0l93S8SSIrrA==
X-Received: by 2002:a17:906:9d8e:b0:84d:3921:11e2 with SMTP id fq14-20020a1709069d8e00b0084d392111e2mr3481848ejc.58.1673212007713;
        Sun, 08 Jan 2023 13:06:47 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id d9-20020a1709063ec900b007c0d6b34d54sm2919231ejj.129.2023.01.08.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:06:47 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/6] clk: sunxi-ng: Allwinner R528/T113 clock support
Date: Sun, 08 Jan 2023 22:06:46 +0100
Message-ID: <4275771.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20221231231429.18357-1-samuel@sholland.org>
References: <20221231231429.18357-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_130650_635111_38C96E17 
X-CRM114-Status: GOOD (  13.12  )
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

RG5lIG5lZGVsamEsIDAxLiBqYW51YXIgMjAyMyBvYiAwMDoxNDoyMyBDRVQgamUgU2FtdWVsIEhv
bGxhbmQgbmFwaXNhbChhKToKPiBSNTI4IGFuZCBUMTEzIGFyZSBTb0NzIGJhc2VkIG9uIHRoZSBz
YW1lIGRlc2lnbiBhcyBEMS9EMXMsIGJ1dCB3aXRoIEFSTQo+IENQVXMgaW5zdGVhZCBvZiBSSVND
LVYuIFRoZXkgdXNlIHRoZSBzYW1lIENDVSBpbXBsZW1lbnRhdGlvbiwgbWVhbmluZwo+IHRoZSBD
Q1UgaGFzIGdhdGVzL3Jlc2V0cyBmb3IgYWxsIHBlcmlwaGVyYWxzIHByZXNlbnQgb24gYW55IFNv
QyBpbiB0aGlzCj4gZmFtaWx5LiBJIHZlcmlmaWVkIHRoZSBDQU4gYnVzIGJpdHMgYXJlIGFsc28g
cHJlc2VudCBvbiBEMS9EMXMuCj4gCj4gUGF0Y2hlcyAxLTIgY2xlYW4gdXAgdGhlIEtjb25maWcg
aW4gcHJlcGFyYXRpb24gZm9yIHBhdGNoIDMsIHdoaWNoCj4gYWxsb3dzIGJ1aWxkaW5nIHRoZSBk
cml2ZXIuIFBhdGNoZXMgNC02IGFkZCB0aGUgbWlzc2luZyBiaW5kaW5nIGhlYWRlcgo+IGFuZCBk
cml2ZXIgYml0cy4KPiAKPiBDaGFuZ2VzIGluIHYyOgo+ICAtIEV4cGFuZCBjb21taXQgbWVzc2Fn
ZQo+ICAtIE1vdmUgZHQtYmluZGluZ3MgaGVhZGVyIGNoYW5nZXMgdG8gYSBzZXBhcmF0ZSBwYXRj
aAo+IAo+IEFuZHLDoXMgU3plbXrFkSAoMSk6Cj4gICBjbGs6IHN1bnhpLW5nOiBkMTogTWFyayBj
cHV4IGNsb2NrIGFzIGNyaXRpY2FsCj4gCj4gRmFiaWVuIFBvdXNzaW4gKDEpOgo+ICAgY2xrOiBz
dW54aS1uZzogZDE6IEFkZCBDQU4gYnVzIGdhdGVzIGFuZCByZXNldHMKPiAKPiBTYW11ZWwgSG9s
bGFuZCAoNCk6Cj4gICBjbGs6IHN1bnhpLW5nOiBSZW1vdmUgZHVwbGljYXRlIEFSQ0hfU1VOWEkg
ZGVwZW5kZW5jaWVzCj4gICBjbGs6IHN1bnhpLW5nOiBNb3ZlIFNvQyBkcml2ZXIgY29uZGl0aW9u
cyB0byBkZXBlbmRlbmNpZXMKPiAgIGNsazogc3VueGktbmc6IGQxOiBBbGxvdyBidWlsZGluZyBm
b3IgUjUyOC9UMTEzCj4gICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBEMSBDQU4gYnVzIGdhdGVz
IGFuZCByZXNldHMKPiAKPiAgZHJpdmVycy9jbGsvc3VueGktbmcvS2NvbmZpZyAgICAgICAgICAg
ICAgfCA3MSArKysrKysrKysrKystLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2Nsay9zdW54aS1uZy9j
Y3Utc3VuMjBpLWQxLmMgICAgICB8IDEzICsrKystCj4gIGRyaXZlcnMvY2xrL3N1bnhpLW5nL2Nj
dS1zdW4yMGktZDEuaCAgICAgIHwgIDIgKy0KPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9z
dW4yMGktZDEtY2N1LmggfCAgMiArCj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvc3VuMjBp
LWQxLWNjdS5oIHwgIDIgKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDM3
IGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzIQoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
