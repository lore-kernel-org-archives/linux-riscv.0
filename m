Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BFBF53D70
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 16:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wZNOxh2vp7ee+KIWzNZVC3irgTVcdybVRaaFV8r2NI=; b=2W3lmeAGGSwKhp
	WZI3Jrsutl0ZrvW0omLT2AIFmpF5GIb++CpirHiJY2qONBHLIbLJ//1T2xhmO74B4J6kpv9pSarip
	g6LHUOrzw5VQHkWx6YFjpf/3FNcIxE3Xuc2P0foiUvovSwolXeoBLbGb6O18Q9PFC/+LZ+l/2HVNv
	9FOshiXXZ6/bQqAsMA71cQePD37hOM1RTqnkKPA/cOipQC4MPRJzNVzPc70Vwk7asPdRp9Xe+MZTG
	WxeZQAf/849ahpbDgvQl8KdU9J1bhupTYvcVPNniKR8sMw4JHZNjKBDp72j8ungLkC5FUvf8N9kox
	IdIfed9N2QrUGDzkTZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AuE-00000004Svm-1E6d;
	Mon, 16 Mar 2026 16:35:02 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AuC-00000004Sur-0z0w
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 16:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773678884; x=1774283684; i=markus.elfring@web.de;
	bh=XqXF4vMbBFMntsivSMFR8is4FLxrKAlXo4gPM05iIWs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=a9FLMTn+d8afrYSlJBWHJWs6qQTpJUC47f6iVpR5W/6hOhx+XSKFf6KoBgDe0onb
	 JjIJsFmiD1eiUymIEGxbiYyydRy1WdwT+Q8DKfRQmXkFlbPTgkLVWHP9TxeXUgpZU
	 K1ndsEhpNQXna+RITuDUE5TFnv+NMRqxysyluMo9xArWvo45IhZcSgmjHjtCRALBf
	 tk31G6zYCxLRkM5NSRELU5PEPFiPSTc18hiXtGs7ViLi0zPdls/xGudtQhNOiIDPl
	 jdWyEdTwzdaMr7qDBYW9mu3k+w0MjVokWIBAhSWNyPObSxKm+I8d9Ws6I54hq7BRJ
	 LsTT3+GO84FPPtX/mQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MECCd-1vuidq3vgj-00FMHm; Mon, 16
 Mar 2026 17:34:44 +0100
Message-ID: <0ff57f8f-910c-4197-9c30-fb285dd69f26@web.de>
Date: Mon, 16 Mar 2026 17:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: riscv: mm: add null check for find_vm_area in set_memory
To: Osama Abdelkader <osama.abdelkader@gmail.com>,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Suren Baghdasaryan <surenb@google.com>, LKML <linux-kernel@vger.kernel.org>
References: <20260314222815.153203-1-osama.abdelkader@gmail.com>
 <71d162ec-8745-4391-a94c-e5b0bacb4fe1@web.de> <abgfx9gpUA6vWvZA@osama>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <abgfx9gpUA6vWvZA@osama>
X-Provags-ID: V03:K1:NuFqbzX3sFyGVsbpILLgyAGzuzGry+m8AT6AtHQNqvOQWayUmg+
 z8INfOHOwFRjZ3uKfp6rRnIcetd9gYftwYNdi8cHM8roSnoUkXxyaRX0wzazwYbbT57LWBW
 8EMbNe4FSNDyOL9kMGYKIYovsEtoMNuNb+MLf18XXbp3OS4DauB0DSBEmTYB4v3EZNBeMJo
 DAJJMZZBJuJDEknPlFvpQ==
UI-OutboundReport: notjunk:1;M01:P0:Auqta6k4QBo=;1t1h4DlSAZ4/QPhEH+SL2vU3seG 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_093500_559798_5A72D344 
X-CRM114-Status: UNSURE (   5.59  )
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

Pj4+IGZpbmRfdm1fYXJlYSgpIGNhbiByZXR1cm4gTlVMTC4gQWRkIGEgbnVsbCBjaGVjayB0byBh
dm9pZCBwb3RlbnRpYWwKPj4+IG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSwgbWF0Y2hpbmcgdGhl
IHBhdHRlcm4gdXNlZCBieSBvdGhlciBhcmNoZXMuCj4+Cj4+IDEuIFdlcmUgYW55IHNvdXJjZSBj
b2RlIGFuYWx5c2lzIHRvb2xzIGludm9sdmVkIGhlcmU/Cj4gCj4gTm8sIGJvdGggd2VyZSBmb3Vu
ZCBkdXJpbmcgbWFudWFsIHJldmlldyBhbmQgY29tcGFyZSB3aXRoIGFybTY0LgoKV291bGQgYmUg
bG9va2luZyBmb3IgdGhlIHN1cHBvcnQgb2YgYWR2YW5jZWQgYXBwcm9hY2hlcwp3aGljaCB3b3Vs
ZCBtYWtlIHN1Y2ggYSDigJxjb21wYXJpc29u4oCdIG1vcmUgY29udmVuaWVudD8KClJlZ2FyZHMs
Ck1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
