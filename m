Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88127EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDTQyr5x4frqd7Nek47npFLlzHR12nvpQJ47JV0JJbs=; b=hhCGMhdH9mzoMS
	n1XezYGHlc+wLIn7dZKWJ8V31XmhzlAFehotZvppboO0s3CIJJ0ovAFRW8fj1SoACwKEwHPUa0WJA
	lIx64KKVJlnTFKvaD91YLD8pkeXlAQdBjlkuHP4/efhkKTtRwXJk6z2kxfl0osFOurzr4wKQNootk
	Ks2XwQO6HOcVm/B4iGcXWWRi0erJVfSwhckiVjnXBhtNJ6Cv6FXdY3LnXd0tHQDMcFVWPdV9dJgEi
	wyOlnUd02agrlh0de8d5NKmeCswhFliMyU0at+vHgkTDLAHpI/k3mKvAyN68ZP0zJOlvBiM0HHi5O
	P5bvhlZSKZvtgl6TfPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgkr-00DUHy-0u;
	Tue, 04 Jul 2023 14:11:45 +0000
Received: from mail-pg1-f181.google.com ([209.85.215.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgkn-00DUGr-1v;
	Tue, 04 Jul 2023 14:11:43 +0000
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-55779047021so3199540a12.3;
        Tue, 04 Jul 2023 07:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688479899; x=1691071899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVWqdQakMSUsv5oj8nSg9QczQrmrUO38b67MhpmWVYY=;
        b=H7Gr16nbbuc3fpGbwflW+X9j0/zUPh0OthR+n+xlrphJQPcS1w5Bj542Kx2Cob5lrA
         Ujh3K/c49w0MtI5cxdBm6vNsRujDWJ4c7TDUX0iD2bavOOcutQT6qu4XcQWOCnLNmq83
         pW4I7ihHMhNFoXdTSGNa7kXwL3p2b9OGKstWi3vKZo6T/Jj9yZ6ddVbigeqGSYIWmjsk
         o3z7KAx3YLxVjUfD3D/mgozoXuu5zxkP4WjFDxcm4DtC5Tc5iPiq5Dg4rVVKxSeghtbM
         4LMXFKsvnjZ7Qi0m4P23oozN0zrcJ/RtFZYsY4HU9G0xQpjG+Lm6GUavrd+jdSfTr2a6
         DGMw==
X-Gm-Message-State: AC+VfDznTpOvy0aKquMpYqvvT+ZqfbHuQoB3DIR6hMbQmMWLeqUtHCMR
	8NbMM5EjFWRRdST4XTo+YS4=
X-Google-Smtp-Source: ACHHUZ4mKI72SACTkxfTB3tQ6Ji13XYniCvY2MHAxg/n5JeT4DfHtHYI7qLyK+rPyEqNoEPYk2/cWg==
X-Received: by 2002:a05:6a20:1456:b0:12c:d9cc:340e with SMTP id a22-20020a056a20145600b0012cd9cc340emr10681222pzi.5.1688479899229;
        Tue, 04 Jul 2023 07:11:39 -0700 (PDT)
Received: from [192.168.50.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id e26-20020a62aa1a000000b00682a9325ffcsm1178509pff.5.2023.07.04.07.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 07:11:38 -0700 (PDT)
Message-ID: <739807cf-4551-4760-83e0-a94026b5c1b8@acm.org>
Date: Tue, 4 Jul 2023 07:11:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [linux-next:master] BUILD REGRESSION
 296d53d8f84ce50ffaee7d575487058c8d437335
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kunit-dev@googlegroups.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
References: <202307032309.v4K1IBoR-lkp@intel.com>
 <7d3d61c694c0e57b096ff7af6277ed6b@kernel.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <7d3d61c694c0e57b096ff7af6277ed6b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_071142_504983_7A60B74E 
X-CRM114-Status: GOOD (  12.32  )
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

T24gNy80LzIzIDAwOjE1LCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4gT24gMjAyMy0wNy0wMyAxNjox
MSwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4+IHRyZWUvYnJhbmNoOgo+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0
Cj4+IG1hc3Rlcgo+PiBicmFuY2ggSEVBRDogMjk2ZDUzZDhmODRjZTUwZmZhZWU3ZDU3NTQ4NzA1
OGM4ZDQzNzMzNcKgIEFkZCBsaW51eC1uZXh0Cj4+IHNwZWNpZmljIGZpbGVzIGZvciAyMDIzMDcw
Mwo+Pgo+IAo+IFsuLi5dCj4gCj4+IFVudmVyaWZpZWQgRXJyb3IvV2FybmluZyAobGlrZWx5IGZh
bHNlIHBvc2l0aXZlLCBwbGVhc2UgY29udGFjdCB1cyBpZgo+PiBpbnRlcmVzdGVkKToKPj4KPj4g
YXJjaC9hcm02NC9rdm0vbW11LmM6MTQ3OjMtOTogcHJlY2VkaW5nIGxvY2sgb24gbGluZSAxNDAK
PiAKPiBUaGlzICppcyogYSBmYWxzZSBwb3NpdGl2ZS4gVGhlIGZ1bmN0aW9uIGlzIGVudGVyZWQg
d2l0aCBhIGxvY2sKPiBoZWxkLCBpdCB3aWxsIGV4aXQgd2l0aCB0aGUgbG9jayBoZWxkIGFzIHdl
bGwuIEluc2lkZSB0aGUgYm9keQo+IG9mIHRoZSBmdW5jdGlvbiwgd2UgcmVsZWFzZSBhbmQgcmVh
Y3F1aXJlIHRoZSBsb2NrLgoKV2hpY2ggdG9vbCByZXBvcnRlZCB0aGlzIG1lc3NhZ2U/IElmIHRo
aXMgbWVzc2FnZSB3YXMgcmVwb3J0ZWQgYnkgCnNwYXJzZSwgaGFzIGl0IGJlZW4gY29uc2lkZXJl
ZCB0byBhZGQgYSBfX211c3RfaG9sZCgpIGFubm90YXRpb24/CgpUaGFua3MsCgpCYXJ0LgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
