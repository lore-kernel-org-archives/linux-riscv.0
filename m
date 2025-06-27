Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08815C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 05:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OCulYpUtwC7hHqC4IH5q+N7VuPC+INd+PV+T4B/UXM=; b=2v4za67EOAHzFO
	sjvBL10CZ/3zSBVo4gZXTSkHs5OigQRt8F3IlWakegGMv0BGOD9wKqL7BqctTJLbNLOs8AbgkzLlZ
	pvmUI52qs3hwjRZVe0Jtn/UT6+VkmbWO9wsyMBO4x2/JorOgG5nhVcvCiMZAKDCgmhT8TExQU5UPx
	weGiXsTRO/jxqDJnW/3It6//bu0zH3ai/SPwWD5R39Jp6upKPnGrpyD308VhenVw6vi871KNSKR5y
	ciwHSY7AoWT3ouWvaiuE3vGg0bmkfYO9DQaKscnWWBVJp1AfvGuF9WStN/n4ChxpTn+SGNVLc095G
	WW2L8TwzGlefUe4jRAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1Lb-0000000Dbo7-2heC;
	Fri, 27 Jun 2025 05:09:59 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1EO-0000000Db4q-2MgI;
	Fri, 27 Jun 2025 05:02:33 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-531466622beso506976e0c.1;
        Thu, 26 Jun 2025 22:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751000551; x=1751605351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=;
        b=LSWLbCfVo7Bf6xGHv2ogcUhqINnQRIqP+c45U6g18Di/J8G78VJEAa/jHDd3jLQtxU
         Y+KirD0+dAaMYJjZ9DmjUSz6uTqOYyOeEp4RIEGY8LjnI0Cf/Qk9V4Lh23w48lCkkZhe
         Du5PfHdJqyvlusIMVVUyElyFO1Js2M9PUJYGt2mJPMlFtDl8ICeHzLdFQh98Ws7hx2V8
         Q0OoH3jZ4STOSu5kfs/wkN2eQYvjTiLhPdGb85qHWZo3l15Lpt4VkLbntDFK9/jhunEY
         OFWz+UijYdM9lMBdKOHI8Y59VkDWI3Xwns87bTeU37lMjX3S5XvtDRPTqQzXTR7P2RLK
         6KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000551; x=1751605351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEyVocKnMCps8xWL9t4dI9N+dVYbiLKomAWOYOvHcuE=;
        b=dxQVXBsl6Eq03Dzu4Z2n+FgAzx1edohy1gmYKe9Led5DFJZi6MBtB122LbhWSLDTo6
         0v5D0WFPVV7ZDOyh2HL+h/JcADGaL8soAuIXH3guk46y//oABLzNaNpKeeevIYYbH+T6
         bpjYcOKnk5xTxSJ3fktZeJy66jOj/lLyRT5JAAGB7lYA3rEXMhMWiSF5JzJTGFNLef0D
         r4ib+HgVHUKlaQT+8W/UvwyiaSCqLGhVrmRZUMPJT5UEgMqUfjOmMwBapGc5aiINUuqt
         1x+EwUCLILL9MPLXJXKaOTyArJzLK1/Mb0dyytDGtz1+3pDYo0t9wK8HA2S0BHHq3d0u
         LrpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9JsST5ZQeCYhR2VpgKAQawlEN53v/KqveNTK/FaJnEpOcO4gUcW5IBKm8enSNuFovWWg2PwrFwGX9BDo=@lists.infradead.org, AJvYcCWrdYmcGqc6h7iwoRVhkPzWMeJnYjaUnvKzF0N970ON2N6pReomJswI6BfAzPaOMDhQlQTW1SkYJz5vKW4K1Ha1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3sI/OVv1oG6fu8ZIjZbS7YyKXlKr6doJ3Pcfn3fzXra2CyXSe
	7jrDRtpOWBrDE+m/N3QZ7nfQ9BWVWnoHogAkV+IFPMeK8rlmDN9lGzxTZGI3QcHqqyuLcpTdmlH
	GAJuGZDwtld2ChZp3OZ6mEjq/EhOFvW2SSqh9
X-Gm-Gg: ASbGncs4BtqxIMfeyhwT0YtIRwfPnyre5LeiDcQM/xHm5NS78ZHGKJYHgcLB8MSJ9mT
	S6mXeXKvJZJiwzhptYgUMhG21murEGLNB0vBdOIhV4gXL/qQp95rarPejy4IAotEQXNsjg4r5BR
	pgv8L7L616XL5+IRTIcCWJ5+YexNDW/Puw5YwVPu2nKPM=
X-Google-Smtp-Source: AGHT+IEvQnJ4QRqSGP2qB52UDJLc95vE2WmXbirVa0pHP16TPMhIb8u9XNfVSz15xZVnzrhavxHSi3E8vgSvANL5nrA=
X-Received: by 2002:a05:6102:149e:b0:4ec:c50c:399f with SMTP id
 ada2fe7eead31-4ee4f692664mr1810518137.11.1751000551372; Thu, 26 Jun 2025
 22:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250627025214.30887-1-lance.yang@linux.dev>
In-Reply-To: <20250627025214.30887-1-lance.yang@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 17:02:20 +1200
X-Gm-Features: Ac12FXywX0xekxUXC52Wn56ratHki1z8cUWVFBJGFLSfqAnwCvDX9QWChaOYL38
Message-ID: <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support
 partial batches
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, Lance Yang <lance.yang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_220232_603242_8E99895A 
X-CRM114-Status: GOOD (  13.48  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgMjo1M+KAr1BNIExhbmNlIFlhbmcgPGlvd29ya2VyMEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTGFuY2UgWWFuZyA8bGFuY2UueWFuZ0BsaW51eC5k
ZXY+Cj4KPiBBcyBwb2ludGVkIG91dCBieSBEYXZpZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9n
aWMgaW4gdHJ5X3RvX3VubWFwX29uZSgpCj4gY2FuIHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRF
IHRhYmxlIGlmIGEgbGFyZ2UgZm9saW8gaXMgbWFwcGVkIHN0YXJ0aW5nIGF0Cj4gdGhlIGxhc3Qg
ZW50cnkgb2YgdGhhdCB0YWJsZS4KPgo+IFNvIGxldCdzIGZpeCB0aGUgb3V0LW9mLWJvdW5kcyBy
ZWFkIGJ5IHJlZmFjdG9yaW5nIHRoZSBsb2dpYyBpbnRvIGEgbmV3Cj4gaGVscGVyLCBmb2xpb191
bm1hcF9wdGVfYmF0Y2goKS4KPgo+IFRoZSBuZXcgaGVscGVyIG5vdyBjb3JyZWN0bHkgY2FsY3Vs
YXRlcyB0aGUgc2FmZSBudW1iZXIgb2YgcGFnZXMgdG8gc2NhbiBieQo+IGxpbWl0aW5nIHRoZSBv
cGVyYXRpb24gdG8gdGhlIGJvdW5kYXJpZXMgb2YgdGhlIGN1cnJlbnQgVk1BIGFuZCB0aGUgUFRF
Cj4gdGFibGUuCj4KPiBJbiBhZGRpdGlvbiwgdGhlICJhbGwtb3Itbm90aGluZyIgYmF0Y2hpbmcg
cmVzdHJpY3Rpb24gaXMgcmVtb3ZlZCB0bwo+IHN1cHBvcnQgcGFydGlhbCBiYXRjaGVzLiBUaGUg
cmVmZXJlbmNlIGNvdW50aW5nIGlzIGFsc28gY2xlYW5lZCB1cCB0byB1c2UKPiBmb2xpb19wdXRf
cmVmcygpLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tL2E2OTQzOThj
LTlmMDMtNDczNy04MWI5LTdlNDljODU3ZmNiZUByZWRoYXQuY29tCj4KPiBGaXhlczogMzU0ZGZm
ZDI5NTc1ICgibW06IHN1cHBvcnQgYmF0Y2hlZCB1bm1hcCBmb3IgbGF6eWZyZWUgbGFyZ2UgZm9s
aW9zIGR1cmluZyByZWNsYW1hdGlvbiIpCj4gU3VnZ2VzdGVkLWJ5OiBEYXZpZCBIaWxkZW5icmFu
ZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEJhcnJ5IFNvbmcgPGJhb2h1YUBr
ZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IExhbmNlIFlhbmcgPGxhbmNlLnlhbmdAbGludXgu
ZGV2PgoKSSdkIHByZWZlciBjaGFuZ2luZyB0aGUgc3ViamVjdCB0byBzb21ldGhpbmcgbGlrZQoi
Rml4IHBvdGVudGlhbCBvdXQtb2YtYm91bmRzIHBhZ2UgdGFibGUgYWNjZXNzIGR1cmluZyBiYXRj
aGVkIHVubWFwIgoKU3VwcG9ydGluZyBwYXJ0aWFsIGJhdGNoaW5nIGlzIGEgY2xlYW51cC1yZWxh
dGVkIGJlbmVmaXQgb2YgdGhpcyBmaXguCkl0J3Mgd29ydGggbWVudGlvbmluZyB0aGF0IHRoZSBh
ZmZlY3RlZCBjYXNlcyBhcmUgcXVpdGUgcmFyZSwKc2luY2UgTUFEVl9GUkVFIHR5cGljYWxseSBw
ZXJmb3JtcyBzcGxpdF9mb2xpbygpLgoKQWxzbywgd2UgbmVlZCB0byBDYyBzdGFibGUuCgpUaGFu
a3MKQmFycnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
