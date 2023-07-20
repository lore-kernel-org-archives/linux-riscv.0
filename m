Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15124EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxDi327nKVeqTtlSpl68LApCuy+egDTmkiaDBaMbmEE=; b=odCLOEyIdOENZX
	Jm+UDdMg3T9Ea4owlE+ncfFf3TjPCe3lQ5yY8rIzOXY2QRGGMXSsNscVGZc3FkemRblniVjGLMDeE
	4TmPiaQHrYGmQz4x6h00JCIntv13SNQiY2RNLGuqMwjQTZm+N+fIDNjPkX38sKQE37H3w/aY/dyAD
	W+F/ThKmBomOG8wOCmC8cMNmZR88pUSueV7OeI6n7wGdReSYGKnMl3ccyRJvqEW1HS0L2qJun2pwC
	Kvr+JG4SwMMGbp9YN5yEByy+HfGwOsxNqq2XWShH/imcwrewzsyZp+wGFI7SqKgMPxNu+O6dW8uOE
	wLYNJ8/2d/4RmwC5awlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNQX-009z7P-2U;
	Thu, 20 Jul 2023 06:46:17 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNQV-009z6Z-0S
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:46:16 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-666eb03457cso249026b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 23:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689835570; x=1692427570;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qgqhs/1lTyAbPO02GYGHlDlSU1g7wtuCLpVWkMtjYf0=;
        b=gK/yn8maJ3MZp6CQUIAEcUT9MWu/7c9O5zZ+YCJ1pu+jAlq4c43AZWLBdZ9vvrX5QN
         hrPcCHgrFxNZTHxwm4wFMnzfO0GfzI2CHYWc0avb1j9tXydTURfGjLVAJNkuKIY0+wiY
         egm7tQqBxZDN7Ee98Pd5Sqc46N/w4egAWWmmN+oS0iZtFd5ojERsHyVa2TsW/Ib9KfRg
         OoyBmi+Sa06WBmrH/drHEur0pMf7u4a0Kmn8QtaAvQNSXMGqYFnAzLyicqJjOPbmRIk6
         qNus9yTF8ytvNRAaulC0r59A9MaEHpZyw/jv2DgVOHBLziHH2yVQqH/py1zR9y7DNNDO
         9SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689835570; x=1692427570;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:date:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qgqhs/1lTyAbPO02GYGHlDlSU1g7wtuCLpVWkMtjYf0=;
        b=li3bu6vifJ/0pPe06tCmPPQdmHu33x9Vrm70XQMeIc9Ih1EZWPlDYkfsTFKlF+B5m/
         WIVa+7kWbN6vQMSjJQg2dM+JohDZz4cM8TdVoLx2b08DSml7Hv4jR8dRs5dUrQP2iZcZ
         1omHw5vlOCusuMzFjUiT+T/U53/jDaVoFpbiOhx128FYB++brdGkWDdD9eHxGjqDqDxQ
         AJeKDnJfGGW3dflm0erC9Wn1WmoD2OdV3LIPOEZYmNWggLvzTe4k8FSqhJCIz4Wmg2ZG
         wuJhvx3HZh1Qia6s9OrRE2JLfaiDfWbkGX8Er8gOe9DQA2Pz2BKWVf+AkP2NOwVPiVtW
         Ij3g==
X-Gm-Message-State: ABy/qLZvBTGZYWVNK8J957Su6oKjlNd9jQdQFkKYY5DKhAj6GVCXotuB
	Ol5Pl9T82XJEB4zwW18yNWU=
X-Google-Smtp-Source: APBJJlHwiV2jMn0EixFhhaqW77Z1RHimnV/10+I0waoX2pIkB3VdJxUPO4dmUTSnX5gjdF3cyZWMwg==
X-Received: by 2002:a05:6a20:6a22:b0:134:d4d3:f0a7 with SMTP id p34-20020a056a206a2200b00134d4d3f0a7mr11293569pzk.9.1689835570008;
        Wed, 19 Jul 2023 23:46:10 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.54])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902728700b001b8a3729c23sm450389pll.17.2023.07.19.23.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 23:46:09 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Thu, 20 Jul 2023 14:46:03 +0800
To: =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Andreas Schwab <schwab@suse.de>
CC: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
User-Agent: K-9 Mail for Android
In-Reply-To: <878rbbkgqo.fsf@all.your.base.are.belong.to.us>
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com> <mvmo7k8cqns.fsf@suse.de> <878rbbkgqo.fsf@all.your.base.are.belong.to.us>
Message-ID: <54D8BFF7-C4D2-417E-B18C-62B5DB17B51B@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_234615_205987_D67258B5 
X-CRM114-Status: UNSURE (   8.61  )
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

T24gSnVseSAyMCwgMjAyMyAxMjoyODo0NyBBTSBHTVQrMDg6MDAsICJCasO2cm4gVMO2cGVsIiA8
Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj5BbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1c2UuZGU+
IHdyaXRlczoKPgo+PiBPbiBKdWwgMTkgMjAyMywgQ2VsZXN0ZSBMaXUgd3JvdGU6Cj4+Cj4+PiBA
QCAtMzA4LDcgKzMxMiw3IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZv
aWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4gIAo+Pj4gIAkJaWYg
KHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPj4+ICAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lz
Y2FsbCk7Cj4+PiAtCQllbHNlCj4+PiArCQllbHNlIGlmICgobG9uZylzeXNjYWxsICE9IC0xTCkK
Pj4KPj4gWW91IGNhbiBhbHNvIHVzZSBzeXNjYWxsICE9IC0xVUwgb3IgZXZlbiBzeXNjYWxsICE9
IC0xLgo+Cj5UaGUgZm9ybWVyIGlzIGluZGVlZCBiZXR0ZXIgZm9yIHRoZSBleWVzISA6LSkgVGhl
IGxhdHRlciB3aWxsIGdldCBhCj4tV3NpZ24tY29tcGFyZSB3YXJuaW5nLCBubz8KPgo+Cj5CasO2
cm4KCldlbGwsIHRoYXQncyB0cnVlLiBBbmQgSSBqdXN0IGZvdW5kIG91dCB0aGF0IGJ5IEMgc3Rh
bmRhcmRzLCBjb252ZXJ0aW5nCnVsb25nIHRvIGxvbmcgaXMgaW1wbGVtZW50YXRpb24tZGVmaW5l
ZCBiZWhhdmlvciwgdW5saWtlIGxvbmcgdG8gdWxvbmcKd2hpY2ggaXMgd2VsbC1kZWZpbmVkLiBT
byBpdCBpcyByZWFsbHkgYmV0dGVyIHRoYW4gKGxvbmcpc3lzY2FsbCAhPSAtMUwuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
