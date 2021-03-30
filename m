Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100D6C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 02:27:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E83561959
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 02:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E83561959
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UDW/2FN/VD+ZBCkNSUfBuqMmDm7D1FP1NbkR7DMl0KU=; b=TZ0TN6nueOWSJpZLkIhxI2R1c
	U5tkaWPgQc1FKjiG10DB35nlW+5znjJsS5mW4tTMWRayalc4o39soItvCgn5eOdIXyMj/bjq52nBK
	uS/6gD7j2Qtb+cqh9n4zc4LjHu2x/dhrdPR1uqB31tYIEH3ztufd+w9YqVFeGZOp2991Fn5kwOiPc
	6vUOrnnv5r0vaH7O0mpSR9DWTjNIV1hDIQsskKePmH328eQ2+PLvXHhg9m+FijXMUBcCmSD/EKO9q
	9AlkU+0cw3t8SX+zn4a46YMzH62SJTZg9/OrqaE9quqcC/TFDKVscb6gUipmxaNEQ871spw+RfVZG
	ixP3ODH1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR45d-002RXH-Hi; Tue, 30 Mar 2021 02:26:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR45T-002RWS-W3
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 02:26:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6564619A9
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 02:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617071194;
 bh=DsNUDKNJ0Zn7ha019DqF6JpRF6ePLDXBpY2fY4Rt5zI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d4cb+mFmuvef/cwfP2zNQ3obGFGjzuzoUwV/X2Zigv4nsZNUWKslRrqdL34xGoLxn
 96WVK3ko/y5YsTXEzBvfqnWDjP0ijpDer3lLY8MPYAeN9i8JVTGiO6vGNYDOowoWHZ
 KWY83N80nfMGMh9gQ6f3pRmEufiZZ3fe3+W58B6HXt6U/owpCK++KKZV9lfwu7cmZz
 lTuJ2/F7BpyWD8Hb7PUf5J1BMo6rogzywecLGkdu3g9KM5rt+XesuBAdPnMbzL2Pt2
 XB8jdv3pb5/7T1ey8dbagvED+OrQQDtvAHHbre4u+uDUBm39lzH+oKQlmdvbJDGg+r
 t8BC3M/LaSv4g==
Received: by mail-lf1-f43.google.com with SMTP id b4so21416454lfi.6
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 19:26:33 -0700 (PDT)
X-Gm-Message-State: AOAM533XXwjjss7Y6RqYK4Ed/4uPkfJMBlenWWFsIKAk7EMXIloJ1vf5
 D1wE5UrSgQkukiUASvWfJXzgoeh9qD04XpkMLY8=
X-Google-Smtp-Source: ABdhPJxU6mxcUsuISjomLk93VoCYmMFU/zeXtni2UcWWrrqJGhcLnr4AAMCcANyUFGhKFwrj3dIEI2b9d5by4xErFtM=
X-Received: by 2002:ac2:5e26:: with SMTP id o6mr18679032lfg.355.1617071192050; 
 Mon, 29 Mar 2021 19:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
 <YGG3JIBVO0w6W3fg@hirez.programming.kicks-ass.net>
 <YGG6Ms5Rl0AOJL2i@hirez.programming.kicks-ass.net>
 <CAJF2gTRwd0QpUZumDFUN1J=effv67ucUdsQ96PJwjBhPgJ1npw@mail.gmail.com>
 <CAK8P3a3jpQ7dDiVG0s_DQiL6n_MdnhYHMjqFfJ92JJBJFPQZPQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3jpQ7dDiVG0s_DQiL6n_MdnhYHMjqFfJ92JJBJFPQZPQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Mar 2021 10:26:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSpnHndT9NkrzvNP6xvqV51_DENwh2BHaduUnGyUE=Jaw@mail.gmail.com>
Message-ID: <CAJF2gTSpnHndT9NkrzvNP6xvqV51_DENwh2BHaduUnGyUE=Jaw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_032636_613144_00D395AD 
X-CRM114-Status: GOOD (  31.04  )
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

T24gTW9uLCBNYXIgMjksIDIwMjEgYXQgOTo1NiBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDI5LCAyMDIxIGF0IDI6NTIgUE0gR3VvIFJlbiA8
Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgTWFyIDI5LCAyMDIxIGF0
IDc6MzEgUE0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gTW9uLCBNYXIgMjksIDIwMjEgYXQgMDE6MTY6NTNQTSArMDIwMCwgUGV0ZXIg
WmlqbHN0cmEgd3JvdGU6Cj4gPiA+ID4gQW55d2F5LCBhbiBhZGRpdGlvbmFsICdmdW5ueScgaXMg
dGhhdCBJIHN1c3BlY3QgeW91IGNhbm5vdCBwcm92ZSBmd2QKPiA+ID4gPiBwcm9ncmVzcyBvZiB0
aGUgZW50aXJlIHByaW1pdGl2ZSB3aXRoIGFueSBvZiB0aGlzIG9uLiBCdXQgd2hvIGNhcmVzCj4g
PiA+ID4gYWJvdXQgZGV0YWlscyBhbnl3YXkuLiA6Lwo+ID4gPgo+ID4gPiBXaGF0J3MgdGhlIGFy
Y2hpdGVjdHVyYWwgZ3VhcmFudGVlIG9uIExML1NDIHByb2dyZXNzIGZvciBSSVNDLVYgPwo+ID4K
PiA+IGZ1bmN0NSAgICB8IGFxIHwgcmwgICB8IHJzMiB8ICByczEgIHwgZnVuY3QzIHwgcmQgfCBv
cGNvZGUKPiA+ICAgICAgNSAgICAgICAgICAxICAgIDEgICAgICA1ICAgICAgIDUgICAgICAgICAz
ICAgICAgICA1ICAgICAgICAgIDcKPiA+IExSLlcvRCAgb3JkZXJpbmcgIDAgICAgIGFkZHIgICAg
d2lkdGggICBkZXN0ICAgIEFNTwo+ID4gU0MuVy9EICBvcmRlcmluZyAgc3JjICBhZGRyICAgIHdp
ZHRoICAgZGVzdCAgICBBTU8KPiA+Cj4gPiBMUi5XIGxvYWRzIGEgd29yZCBmcm9tIHRoZSBhZGRy
ZXNzIGluIHJzMSwgcGxhY2VzIHRoZSBzaWduLWV4dGVuZGVkCj4gPiB2YWx1ZSBpbiByZCwgYW5k
IHJlZ2lzdGVycyBhIHJlc2VydmF0aW9uIHNldOKAlGEgc2V0IG9mIGJ5dGVzIHRoYXQKPiA+IHN1
YnN1bWVzIHRoZSBieXRlcyBpbiB0aGUgYWRkcmVzc2VkIHdvcmQuIFNDLlcgY29uZGl0aW9uYWxs
eSB3cml0ZXMgYQo+ID4gd29yZCBpbiByczIgdG8gdGhlIGFkZHJlc3MgaW4gcnMxOiB0aGUgU0Mu
VyBzdWNjZWVkcyBvbmx5IGlmIHRoZQo+ID4gcmVzZXJ2YXRpb24gaXMgc3RpbGwgdmFsaWQgYW5k
IHRoZSByZXNlcnZhdGlvbiBzZXQgY29udGFpbnMgdGhlIGJ5dGVzCj4gPiBiZWluZyB3cml0dGVu
LiBJZiB0aGUgU0MuVyBzdWNjZWVkcywgdGhlIGluc3RydWN0aW9uIHdyaXRlcyB0aGUgd29yZAo+
ID4gaW4gcnMyIHRvIG1lbW9yeSwgYW5kIGl0IHdyaXRlcyB6ZXJvIHRvIHJkLiBJZiB0aGUgU0Mu
VyBmYWlscywgdGhlCj4gPiBpbnN0cnVjdGlvbiBkb2VzIG5vdCB3cml0ZSB0byBtZW1vcnksIGFu
ZCBpdCB3cml0ZXMgYSBub256ZXJvIHZhbHVlIHRvCj4gPiByZC4gUmVnYXJkbGVzcyBvZiBzdWNj
ZXNzIG9yIGZhaWx1cmUsIGV4ZWN1dGluZyBhbiBTQy5XIGluc3RydWN0aW9uCj4gPiAqaW52YWxp
ZGF0ZXMgYW55IHJlc2VydmF0aW9uIGhlbGQgYnkgdGhpcyBoYXJ0Ki4KPiA+Cj4gPiBNb3JlIGRl
dGFpbHMsIHJlZjoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFs
Cj4KPiBJIHRoaW5rIHNlY3Rpb24gIjMuNS4zLjIgUmVzZXJ2YWJpbGl0eSBQTUEiIFsxXSB3b3Vs
ZCBiZSBhIG1vcmUgcmVsZXZhbnQKPiBsaW5rLCBhcyB0aGlzIGRlZmluZXMgbWVtb3J5IGFyZWFz
IHRoYXQgZWl0aGVyIGRvIG9yIGRvIG5vdCBoYXZlCj4gZm9yd2FyZCBwcm9ncmVzcyBndWFyYW50
ZWVzLCBpbmNsdWRpbmcgdGhpcyBwYXJ0Ogo+Cj4gICAgIldoZW4gTFIvU0MgaXMgdXNlZCBmb3Ig
bWVtb3J5IGxvY2F0aW9ucyBtYXJrZWQgUnNydk5vbkV2ZW50dWFsLAo+ICAgICAgc29mdHdhcmUg
c2hvdWxkIHByb3ZpZGUgYWx0ZXJuYXRpdmUgZmFsbC1iYWNrIG1lY2hhbmlzbXMgdXNlZCB3aGVu
Cj4gICAgICBsYWNrIG9mIHByb2dyZXNzIGlzIGRldGVjdGVkLiIKPgo+IE15IHJlYWRpbmcgb2Yg
dGhpcyBpcyB0aGF0IGlmIHRoZSBleGFtcGxlIHlvdSB0cmllZCBzdGFsbHMsIHRoZW4gZWl0aGVy
Cj4gdGhlIFBNQSBpcyBub3QgUnNydkV2ZW50dWFsLCBhbmQgaXQgaXMgd3JvbmcgdG8gcmVseSBv
biBsbC9zYyBvbiB0aGlzLAo+IG9yIHRoYXQgdGhlIFBNQSBpcyBtYXJrZWQgUnNydkV2ZW50dWFs
IGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaXMKPiBidWdneS4KWWVzLCBQTUEganVzdCBkZWZpbmVz
IHBoeXNpY2FsIG1lbW9yeSByZWdpb24gYXR0cmlidXRlcywgQnV0IGluIG91cgpwcm9jZXNzb3Is
IHdoZW4gTU1VIGlzIGVuYWJsZWQgKHNhdHAncyB2YWx1ZSByZWdpc3RlciA+IDIpIGluIHMtbW9k
ZSwKaXQgd2lsbCBsb29rIGF0IG91ciBjdXN0b20gUFRFJ3MgYXR0cmlidXRlcyBCSVQoNjMpIHJl
ZiBbMV06CgogICBQVEUgZm9ybWF0OgogICB8IDYzIHwgNjIgfCA2MSB8IDYwIHwgNTkgfCA1OC04
IHwgNyB8IDYgfCA1IHwgNCB8IDMgfCAyIHwgMSB8IDAKICAgICBTTyAgIEMgICAgQiAgICBTSCAg
IFNFICAgIFJTVyAgIEQgICBBICAgRyAgIFUgICBYICAgVyAgIFIgICBWCiAgICAgXiAgICBeICAg
IF4gICAgXiAgICBeCiAgIEJJVCg2Myk6IFNPIC0gU3Ryb25nIE9yZGVyCiAgIEJJVCg2Mik6IEMg
IC0gQ2FjaGVhYmxlCiAgIEJJVCg2MSk6IEIgIC0gQnVmZmVyYWJsZQogICBCSVQoNjApOiBTSCAt
IFNoYXJlYWJsZQogICBCSVQoNTkpOiBTRSAtIFNlY3VyaXR5CgpTbyB0aGUgbWVtb3J5IGFsc28g
Y291bGQgYmUgUnNydk5vbmUvUnNydkV2ZW50dWFsLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9j
LXNreS9jc2t5LWxpbnV4L2NvbW1pdC9lODM3YWFkMjMxNDg1NDI3NzE3OTRkOGEyZmNjNTJhZmQw
ZmNiZjg4Cgo+Cj4gSXQgYWxzbyBzZWVtcyB0aGF0IHRoZSBjdXJyZW50ICJhbW9zd2FwIiBiYXNl
ZCBpbXBsZW1lbnRhdGlvbgo+IHdvdWxkIGJlIHJlbGlhYmxlIGluZGVwZW5kZW50IG9mIFJzcnZF
dmVudHVhbC9Sc3J2Tm9uRXZlbnR1YWwuClllcywgdGhlIGhhcmR3YXJlIGltcGxlbWVudGF0aW9u
IG9mIEFNTyBjb3VsZCBiZSBkaWZmZXJlbnQgZnJvbSBMUi9TQy4KQU1PIGNvdWxkIHVzZSBBQ0Ug
c25vb3AgaG9sZGluZyB0byBsb2NrIHRoZSBidXMgaW4gaHcgY29oZXJlbmN5CmRlc2lnbiwgYnV0
IExSL1NDIHVzZXMgYW4gZXhjbHVzaXZlIG1vbml0b3Igd2l0aG91dCBsb2NraW5nIHRoZSBidXMu
Cgo+IGFybTY0IGlzIGFscmVhZHkgaW4gdGhlIHNpdHVhdGlvbiBvZiBoYXZpbmcgdG8gY2hvb3Nl
IGJldHdlZW4KPiB0d28gY21weGNoZygpIGltcGxlbWVudGF0aW9uIGF0IHJ1bnRpbWUgdG8gYWxs
b3cgZmFsbGluZyBiYWNrIHRvCj4gYSBzbG93ZXIgYnV0IG1vcmUgZ2VuZXJhbCB2ZXJzaW9uLCBi
dXQgaXQncyBiZXN0IHRvIGF2b2lkIHRoYXQgaWYgeW91Cj4gY2FuLgpDdXJyZW50IFJJU0MtViBu
ZWVkbid0IG11bHRpcGxlIHZlcnNpb25zIHRvIHNlbGVjdCwgYW5kIGFsbCBBTU8gJgpMUi9TQyBo
YXMgYmVlbiBkZWZpbmVkIGluIHRoZSBzcGVjLgoKUklTQy1WIGhhc24ndCBDQVMgaW5zdHJ1Y3Rp
b25zLCBhbmQgaXQgdXNlcyBMUi9TQyBmb3IgY21weGNoZy4gSSBkb24ndAp0aGluayBMUi9TQyB3
b3VsZCBiZSBzbG93ZXIgdGhhbiBDQVMsIGFuZCBDQVMgaXMganVzdCBnb29kIGZvciBjb2RlCnNp
emUuCgo+Cj4gICAgICAgICAgQXJuZAo+Cj4gWzFdIGh0dHA6Ly93d3cuZml2ZS1lbWJlZGRldi5j
b20vcmlzY3YtaXNhLW1hbnVhbC9sYXRlc3QvbWFjaGluZS5odG1sI2F0b21pY2l0eS1wbWFzCgot
LQpCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
