Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C685C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6ehrpyGwkFXlH6rYjdoUVFJXoSJdKFqmYaVbX0OOvE=; b=tf630/r0pBXrfQ
	lvYDfjB+/tUxScG6aWaXCQRQ1OKPULgr9kfq0iFwpx6pjJMrRZCKF33HshT8MOuVLLVXRASStvoYD
	bKCYUx7gibZyZKLAaaXu2lizSsgJfzxb075k39TcO4RfhhtjgSS69b22Dz6FHeCO2SfJrGpEtqFZi
	UQAQ20E4QnXdnUVfIJGZEwZs/JbQN5fOH/43S+oCJaC/2Bpe3RpoFkkbRfPvzuG1boVOIojOoS7/6
	MqhIDQQLXzhpqJHhpzzNUpPDwekW3IyZmmaOyQ/VSTPy4+5LLaDrkVlrtHT1W7r29VsfeeuC/UnDy
	ETU6qpaLRP1wMKNZ7ZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHP1-002vWh-54; Tue, 08 Nov 2022 05:44:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHOy-002vUM-Bx; Tue, 08 Nov 2022 05:44:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id b21so13229100plc.9;
        Mon, 07 Nov 2022 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UicMHRBXNKZ6klzBYtNlGfdpT3ipHtBcp9O7LuoFbE=;
        b=XNdeC13pb4LjOBaRWcKMBNqFRJ+RgsbfVoNw18z5L+vfkg1SZceZjUxbLhiIy1qySy
         Y4hI02da8j9ev8qt2sUsGeUiOSLlDAUgz5JUplPGm8kAk4jLtNdmDFZCCStM1EGIelNU
         pjjtL4FSGAVwgisQucoSj4vLVpkgLqzZdzX9wYytiy3sfYNB3aYKj8S/Nug5gaKAa8gA
         /5oDb+KCNmSa3bC/jNyCQmeij+quPN3cyVSSr1ovXCPVJxrqYAAydTsm3Q4bRt6yNhxm
         6FVSyKTuVZN23UWZkdV6Uc7djgZpboRwjQPImKvKrchYImM3eB6pVBMtJk1jJ8Nfk6ob
         kIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UicMHRBXNKZ6klzBYtNlGfdpT3ipHtBcp9O7LuoFbE=;
        b=JaLkEfL7XnTBc0JIT82t+Mg7eW2Sy3flENaVZyynXYOt97Y6mcYbBMKdkCOzJdZwzs
         PRs9gBkvSyq/eTPeDn2LdselQ/pmEMIIsMZqMH3zE0nn6e5DG9h317g/3P9jL+9g+h98
         sCc6qG0dvSQR0wJCK/+6TjnIM1SgIWKEcdWM5/uMfVHfStHpeT5v+VKV3YyjjJ9hQoDA
         4Eucml+JFpqnMlFU4ggup/4feZOpBY3bTu2lFPKJQtnsa/2h/0ryTGh7/23Jm+6HTz7E
         5+bwIwOFGZsJ6oy5eQ/FRkxQETh7Iz7NeUnkcxuu8mSE/tL8tu/EZW5GKhzwTCX/kBYG
         D/JQ==
X-Gm-Message-State: ACrzQf0EkP4utXkqow4lFjXHJm84jAbgAk6PPAj0FagUMQkbBVrDMHwb
	GYEDRkjf7OpcJLH/iRmtTmk=
X-Google-Smtp-Source: AMsMyM6Ssf7qu6Zt1cmqzeY+6ksfJF4jyx1t2euaZBhwzvq5JPVY+8zsaODdG48vWXQYQDWTdtSyvw==
X-Received: by 2002:a17:90b:4a04:b0:213:587b:204e with SMTP id kk4-20020a17090b4a0400b00213587b204emr55088612pjb.98.1667886235549;
        Mon, 07 Nov 2022 21:43:55 -0800 (PST)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id k21-20020a628415000000b0056bb06ce1cfsm5614872pfd.97.2022.11.07.21.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 21:43:55 -0800 (PST)
Date: Mon, 7 Nov 2022 21:43:54 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "Christopherson,, Sean" <seanjc@google.com>,
	"isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"Yao, Yuan" <yuan.yao@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"david@redhat.com" <david@redhat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"Gao, Chao" <chao.gao@intel.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <20221108054354.GA1708572@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
 <Y2V1oslbw24/2Opd@google.com>
 <20221107214634.GE1063309@ls.amr.corp.intel.com>
 <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_214400_449613_57CA35A4 
X-CRM114-Status: GOOD (  21.60  )
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

T24gVHVlLCBOb3YgMDgsIDIwMjIgYXQgMDE6MDk6MjdBTSArMDAwMCwKIkh1YW5nLCBLYWkiIDxr
YWkuaHVhbmdAaW50ZWwuY29tPiB3cm90ZToKCj4gT24gTW9uLCAyMDIyLTExLTA3IGF0IDEzOjQ2
IC0wODAwLCBJc2FrdSBZYW1haGF0YSB3cm90ZToKPiA+ID4gT24gRnJpLCBOb3YgMDQsIDIwMjIs
IElzYWt1IFlhbWFoYXRhIHdyb3RlOgo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIHNlcmll
cy4gSSB0aGUgcmViYXNlZCBURFggS1ZNIHBhdGNoIHNlcmllcyBhbmQgaXQKPiA+ID4gPiB3b3Jr
ZWQuCj4gPiA+ID4gU2luY2UgY3B1IG9mZmxpbmUgbmVlZHMgdG8gYmUgcmVqZWN0ZWQgaW4gc29t
ZSBjYXNlcyhUbyBrZWVwIGF0IGxlYXN0IG9uZQo+ID4gPiA+IGNwdQo+ID4gPiA+IG9uIGEgcGFj
a2FnZSksIGFyY2ggaG9vayBmb3IgY3B1IG9mZmxpbmUgaXMgbmVlZGVkLgo+ID4gPiAKPiA+ID4g
SSBoYXRlIHRvIGJyaW5nIHRoaXMgdXAgYmVjYXVzZSBJIGRvdWJ0IHRoZXJlJ3MgYSByZWFsIHVz
ZSBjYXNlIGZvciBTVVNQRU5ECj4gPiA+IHdpdGgKPiA+ID4gVERYLCBidXQgdGhlIENQVSBvZmZs
aW5lIHBhdGggaXNuJ3QganVzdCBmb3IgdHJ1ZSBvZmZsaW5pbmcgb2YgQ1BVcy7CoCBXaGVuCj4g
PiA+IHRoZQo+ID4gPiBzeXN0ZW0gZW50ZXJzIFNVU1BFTkQsIG9ubHkgdGhlIGluaXRpYXRpbmcg
Q1BVIGdvZXMgdGhyb3VnaAo+ID4gPiBrdm1fc3VzcGVuZCgpK2t2bV9yZXN1bWUoKSwKPiA+ID4g
YWxsIHJlc3BvbmRpbmcgQ1BVcyBnbyB0aHJvdWdoIENQVSBvZmZsaW5lK29ubGluZS7CoCBJLmUu
IGRpc2FsbG93aW5nIGFsbAo+ID4gPiBDUFVzIGZyb20KPiA+ID4gZ29pbmcgIm9mZmxpbmUiIHdp
bGwgcHJldmVudCBzdXNwZW5kaW5nIHRoZSBzeXN0ZW0uCj4gPiAKPiA+IFRoZSBjdXJyZW50IFRE
WCBLVk0gaW1wbGVtZW50YXRpb24gZGlzYWxsb3dzIENQVSBwYWNrYWdlIGZyb20gb2ZmbGluZSBv
bmx5Cj4gPiB3aGVuCj4gPiBURHMgYXJlIHJ1bm5pbmcuwqAgSWYgbm8gVEQgaXMgcnVubmluZywg
Q1BVIG9mZmxpbmUgaXMgYWxsb3dlZC7CoCBTbyBiZWZvcmUKPiA+IFNVU1BFTkQsIFREcyBuZWVk
IHRvIGJlIGtpbGxlZCB2aWEgc3lzdGVtZCBvciBzb21ldGhpbmcuwqAgQWZ0ZXIga2lsbGluZyBU
RHMsCj4gPiB0aGUKPiA+IHN5c3RlbSBjYW4gZW50ZXIgaW50byBTVVNQRU5EIHN0YXRlLgo+IAo+
IFRoaXMgc2VlbXMgbm90IGNvcnJlY3QuICBZb3UgbmVlZCBvbmUgY3B1IGZvciBlYWNoIHRvIGJl
IG9ubGluZSBpbiBvcmRlciB0bwo+IGNyZWF0ZSBURCBhcyB3ZWxsLCBhcyBUREguTU5HLktFWS5D
T05GSUcgbmVlZHMgdG8gYmUgY2FsbGVkIG9uIGFsbCBwYWNrYWdlcywKPiBjb3JyZWN0PwoKVGhh
dCdzIGNvcnJlY3QuIEluIHN1Y2ggY2FzZSwgdGhlIGNyZWF0aW9uIG9mIFREIGZhaWxzLiAgVEQg
Y3JlYXRpb24gY2hlY2tzIGlmCmF0IGxlYXN0IG9uZSBjcHUgaXMgb25saW5lIG9uIGFsbCBDUFUg
cGFja2FnZXMuICBJZiBubywgZXJyb3IuCi0tIApJc2FrdSBZYW1haGF0YSA8aXNha3UueWFtYWhh
dGFAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
