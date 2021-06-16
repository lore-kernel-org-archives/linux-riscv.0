Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9ACC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 15:05:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA30611BE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 15:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA30611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rT/q3q3zLGbTGiPI9aWSrIJQjDfNQjCX3sXTlXsEjz4=; b=foBuVPBY+S45nnfW5vJ6KXzytu
	a3bB3e7oFpfRqHqqdujBKpJ94bgVSwudngDHBB90Ygv7bm6pEgofXYVT/O/5h4Z0UiU2hUM56Hcx8
	lsnGLLFhjG/JbldQsnMd2ZUuZNe/1242eI4e4zwXu6JJ1Wfj8Ufi4YpWtBjF3CjURh8mIKBxtCQec
	SDLYepQRLG0dXuO5+9QtZGaBdlLdmZrFJJPgBIgF/UIBFQR+jFuBNEJZzQyILwrwnoIoPaX1DXc6a
	061cqEhnt2VrFuZPkkLu11rdEppP72pE/J4g8XtCKvGxxNNO+q+qsmyhbxIiOSNJ5rygaX2CoqDFj
	hH0XYzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltX64-006onn-To; Wed, 16 Jun 2021 15:04:52 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltX61-006om4-I0
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 15:04:51 +0000
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MRCFw-1lhUQP0Do4-00N8qA; Wed, 16 Jun 2021 17:04:33 +0200
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Bill Mills <bill.mills@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210616114934.n3grzuh6c64wlaj6@vireshk-i7>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <5cffb354-0d00-5ace-260d-61ac0c4c7491@metux.net>
Date: Wed, 16 Jun 2021 17:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616114934.n3grzuh6c64wlaj6@vireshk-i7>
Content-Language: tl
X-Provags-ID: V03:K1:TxZhqDkofwIuzNYeg+qu2UL02JUe3fVzRzNE+2oUee67DdHJvQj
 q68S++GyWXVYp+8YHOUzcK4e67z2YLSPoX1VGgXSjWI7wHjS7X84d832LyWhsYq3VkTR/jp
 3pXJGRF7jXozXa2lUgk2lettiOeyxpf4g1ByE/sVy/yFtpOgrlPRb1DjgVOXpJyQAKqJE7X
 B1fZ5Vk5eKnhCra7mY27A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KynWfsTDx+Y=:tdRvN0rPwvPA1iIfjnn957
 fBCcpBlKMO/VHCgP+l4KYYTomIAtZx0fnUehwFlSijk7EC88TgVxfJZyGmuL0PAMXD2VitROp
 YnMaHdBiyiMO3K6pJmJZtaBqGoV+e4Cobu75qDqcL4aZXsRJZHp8cdZlyuJBZu0ZDsMF4Hgzb
 030bZpqQFnSC4HSAuITLo454K0TwH5hUODZ4jgcpS+NpAAieWTdmdxrJcREZJUlHQ11LkXZm/
 ilJtB8gShOziz+Vdjb9/aWqlWbpl6wkdFkgydp8xAcTCf+aHuh/L8U5RbvSp0mrajzYCFlDjh
 NcZPuB2CMeI6nFo6K1uumTOUMhuO+zzNqS9jX4RBb4GpWH7dZyvvH8bMxdpAViVkEEgBSjbfo
 UeRFFekpBPjpNt9+w6CvxBeHPNvG2GWm38pQtsmi3kb+8qtqlX1wqkVbLP1FTwNgUJ6fpLIOm
 BsV4sy+ScU5DyUJocDfD7elOFF9PnjwP9QXOG+X+aU/g6QzqTDQb37qOWkTxlBiErrRaE3ht5
 cT+hnnMvdKgkKCL3SNaN20=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_080449_956726_C31758E9 
X-CRM114-Status: GOOD (  35.24  )
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

T24gMTYuMDYuMjEgMTM6NDksIFZpcmVzaCBLdW1hciB3cm90ZToKCj4gSSBhbSBub3QgbG9va2lu
ZyB0byBnZXQgYW55IGNyZWRpdHMgZm9yIHRoZSBjb2RlIG9yIHNwZWMgaGVyZS4gSSBkb24ndAo+
IHJlYWxseSBjYXJlIGFib3V0IHRoYXQuIEZvciB0aGUgdmVyeSBzYW1lIHJlYXNvbiBJIGtlcHQg
eW91IGFzIHRoZQo+IGF1dGhvciBvZiB0aGUgMXN0IHBhdGNoIGluIHRoZSBrZXJuZWwgc2VyaWVz
LCBzbyBnaXQga2VlcHMgc2hvd2luZyB5b3UKPiBhcyB0aGUgb3JpZ2luYWwgYXV0aG9yLgoKRmlu
ZSwgYW5kIEknbSBub3QgaW50ZW50aW5nIHRvIGZpZ2h0IG92ZXIgY3JlZGl0cy4gSSdtIGp1c3Qg
aW50ZXJlc3RlZAppbiBoYXZpbmcgYSBzb2xpZCBzb2x1dGlvbi4KCj4gQWxsIEkgd2FudGVkIHRv
IHdvcmsgb24gd2FzIHRoZSBiYWNrZW5kIChpbiBydXN0KS4gCgpPa2F5LCBidXQgd2h5IGRpZCB5
b3UgY2hhbmdlIHRoZSB3aG9sZSB0aGluZyBpbnRvIHNvbWV0aGluZyBjb21wbGV0ZWx5CmRpZmZl
cmVudCA/Cgo+IFlvdSBvbmx5IGV2ZXIgc2VudCAxIHJlYWwgdmVyc2lvbnMgb2YgdGhlIExpbnV4
IGRyaXZlciwgdGhhdCB0b28KPiAiNi1tb250aHMtYmFjayIsIHRoZXJlIHdlcmUgbm8gcmVhbCBi
bG9ja2VycyBhbnl3aGVyZSBhbmQgeW91IG5ldmVyCj4gYXR0ZW1wdGVkIHRvIHVwc3RyZWFtIGFu
eXRoaW5nLgoKVGhlIGJhY2tsb2cgd2FzIGluIHRoZSBtYWlsbGlzdCBhcmNoaXZlLiBJdCB3YXMg
anVzdCBsaW5nZXJpbmcgYmVjYXVzZQpvZiB5ZXQgbWlzc2luZyBmb3JtYWwgcmVnaXN0ZXJpbmcg
dy8gdml0aW8gVEMgYW5kIEkndmUgYmVlbiB0byBidXN5IHdpdGgKbW9yZSBwcmVzc2luZyB0YXNr
cy4gKGZvciBleGFtcGxlIEkndmUgZ290IGtlZXAgcHVibGljIGluZnJhc3RydWN0dXJlCnN0dWZm
IHVwIGFuZCBydW5uaW5nIHdoaWxlIGZvbGtzIGFyZSBpbiBsb2NrZG93bikuCgo+IFNpbWlsYXJs
eSwgeW91ICJuZXZlciIgc2VudCB0aGUgc3BlY2lmaWNhdGlvbiBwcm9wZXJseSB0byB0aGUgdmly
dGlvCj4gbGlzdHMgZm9yIHJldmlldy4gWW91IHNlbnQgaXQgb25jZSBhcyBhbiBhdHRhY2htZW50
IHRvIGFuIGVtYWlsLCB3aGljaAo+IG5vIG9uZSBldmVyIHJlY2VpdmVkLgoKSGFsZiBjb3JyZWN0
OiBJIHNlbnQgaXQgdG8gdGhlIGxpc3QsIGJ1dCB0aGlzIHdhc24ndCB0ZXgnaWZpZWQgeWV0LgoK
PiBXaGVuIEkgdHJpZWQgdG8gbW92ZSB0aGlzIGZvcndhcmQsIGludmVzdGVkIGEgbG90IG9mIHRp
bWUgaW50byBtYWtpbmcKPiBpdCBiZXR0ZXIgZnJvbSBzcGVjaWZpY2F0aW9uIHRvIGNvZGUsIHJl
dmlld3Mgc3RhcnRlZCBoYXBwZW5pbmcsIHlvdQo+IGRlY2lkZWQgdG8gc3RhcnQgYmxvY2tpbmcg
aXQgYWdhaW4uCgpXaGVuIHdlIGhhZCBhbiBlbWFpbCBjb252ZXJzYXRpb24gYWJvdXQgdGhpcywg
aXQgd2FzIGFib3V0IHN1Ym1pdHRpbmcKdGhlIGV4aXN0aW5nIHNwZWMgaW4gYSBmb3JtYWwgY29y
cmVjdCB3YXkuIERvbid0IGdldCBtZSB3cm9uZzogSQphcHJlY2lhdGUgdGhhdCBzb21lYm9keSdz
IGRvaW5nIHRoZSBiZWF1cm9jcmF0aWMgd29yay4gQnV0IHN0aWxsIGhhdmUKbm8gaWRlYSB3aHkg
eW91IGNoYW5nZWQgaXQgY29tcGxldGVseSwgc28gdGhlcmUncyBxdWl0ZSBub3RoaW5nIGxlZnQK
YnV0IHRoZSBuYW1lIGFuZCB0aGF0IGl0IHNvbWVob3cgZG9lcyBncGlvIHZpYSB2aXJ0aW8uCgo+
IExpbnV4IHVwc3RyZWFtIGRvZXNuJ3QgcmVhbGx5IGNhcmUgYWJvdXQgdGhpcywgeW91IGNhbiBh
c2sgYW55IExpbnV4Cj4gTWFpbnRhaW5lciBhYm91dCB0aGlzLiAKCkkgaGFwcGVuIHRvIGJlIGEg
bWFpbnRhaW5lciBteXNlbGYsIGFuZCB3ZSBkbyBhY3R1YWxseSBjYXJlIGFib3V0CndoZXRoZXIg
c29tZSB0aGluZyBpcyB3ZWxsIHRlc3RlZC4KCj4gSWYgeW91ciBjb2RlIGFuZCBzcGVjaWZpY2F0
aW9uIGlzbid0IGRvaW5nIHRoZQo+IHJpZ2h0IHRoaW5nLCBhbmQgaXNuJ3QgZ29vZCBlbm91Z2gs
IHlvdSB3aWxsIGJlIGFza2VkIHRvIHVwZGF0ZSBpdAo+IHVwb24gcmV2aWV3cy4KCk9rYXksIHBs
ZWFzZSB0ZWxsIG1lLCB3aGVyZSBleGFjdGx5IGlzbid0IHJpZ2h0IGFuZCB3aHkgc28uCgo+IFlP
VSBKVVNUIENBTidUIFNBWSBJIFdPTidUIGJlY2F1c2UgSSBoYXZlIHByb2R1Y3RzIGJhc2VkIG9u
IHRoaXMKPiB2ZXJzaW9uLgoKTW9zdCBvZiBkcml2ZXIgZGV2ZWxvcG1lbnQgZ29lcyBwcmV0dHkg
bXVjaCBsaWtlIHRoaXMuIFllcywgd2Ugd291bGQKcHJlZmVyIEhXIGFuZCBGVyB2ZW5kb3JzIHRv
IHRhbGsgd2l0aCB1cyBmaXJzdCwgYnV0IHRoYXQgcmFyZWx5IGhhcHBlbnMuCgo+Pj4gICAgICAq
IHZpcnRpbyBzcGVjIGhhcyBiZWVuIHN1Ym1pdHRlZCB0byB2aXJ0aW8gVEMKPiAKPiBXaGljaCBz
cGVjaWZpY2F0aW9uIGFyZSB5b3UgdGFsa2luZyBhYm91dCBoZXJlID8gVGhlIG9ubHkKPiBzcGVj
aWZpY2F0aW9uIEkgY2FuIHNlZSBvbiB2aXJ0aW8gbGlzdHMgaXMgdGhlIG9uZSBJIHNlbnQuCgpU
aGUgb25lIEkndmUgcmVzZW50IChub3cgdGV4aWZpZWQpIGEgZmV3IGRheXMgYWdvLiBJdCBoYWQg
YmVlbiBzdWJtaXR0ZWQKaW4gYXNjaWkgZm9ybSBsYXN0IHllYXIuIFRoZSBhbnN3ZXIgZnJvbSB2
aXJ0aW8gVEMgZm9sa3Mgd2hhcyB0aGF0IHRoZXJlCmFyZSBzb21lIGZvcm1hbCBzdGVwcyB0byBi
ZSBkb25lIGFuZCBpdCBuZWVkcyB0byBiZSBwYXRjaGVkIGludCB0aGVpcgp0ZXggZG9jdW1lbnQu
Cgo+IEFuZCB0aGUgZHJpdmVyIHlvdSB0cmllZCB0byBzZW5kIGlzbid0IGFsaWduZWQgdG8gdGhh
dCBmb3Igc3VyZSwgYW5kCj4gaXQgdGFrZXMgdXMgYmFjayBmcm9tIGFsbCB0aGUgaW1wcm92ZW1l
bnRzIEkgdHJpZWQgdG8gZG8uCgpXaGljaCBpbXByb3ZlbWVudHMsIGV4YWN0bHkgPyBVbmZvcnR1
bmF0ZWx5LCB5b3UgbmV2ZXIgdGFsa2VkIHRvIG1lCndoYXQgZXhhY3RseSB5b3UndmUgYmVlbiBt
aXNzaW5nLgoKSSByZWFsbHkgaGF2ZSBubyBpZGVhLCB3aHkgeW91IGp1c3QKCj4gSSBhbSBub3Qg
c2F5aW5nIHRoYXQgbXkgdmVyc2lvbiBvZiB0aGUgc3BlY2lmaWNhdGlvbiBpcyB0aGUgYmVzdCBh
bmQKPiB0aGVyZSBpcyBubyBmbGF3IGluIGl0LiAKCkkgZGlkIG91dGxpbmUgc2V2ZXJhbCBwcm9i
bGVtcyBvZiB5b3VyIHNwZWMgb24gdmlydGlvIGxpc3QuIFRoaW5ncyB0aGF0CmFscmVhZHkgaGFk
IGFscmVhZHkgaW5jb3Jwb3JhdGVkIGluIG15IG9yaWdpbmFsIG9uZS4KClJlYWxseSwgSSBoYXZl
IG5vIGlkZWEgd2h5IHlvdSd2ZSBuZXZlciB0YWxrZWQgdG8gbWUgb24gc3BlY2lmaWMgaXNzdWVz
LApidXQgaW5zdGVhZCB0aHJldyBhd2F5LCBtYWRlIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZl
cmVudCBhbmQgZXZlbgpjbGFpbSBpdCB3b3VsZCBiZSBqdXN0IGtpbmRhICJtaW5vciB1cGdyYWRl
IiBvZiBtaW5lLiBXVEYgPyEKCj4gVGhlcmUgaXMgbm8gcG9pbnQgZ29pbmcgYmFja3dhcmRzIG5v
dyBhZnRlciBtYWtpbmcgc28gbXVjaCBvZgo+IHByb2dyZXNzLiBFdmVuIGlmIHlvdSB0cnkgdG8g
c2VuZCB5b3VyIHZlcnNpb24sIGl0IHdpbGwgc2xvd2x5IGFuZAo+IHNsb3dseSByZWFjaCB2ZXJ5
IGNsb3NlIHRvIG15IGxhdGVzdCB2ZXJzaW9uIG9mIGNvZGUgYW5kIHNwZWMuIAoKT3IgdGhlIG90
aGVyIHdheSByb3VuZCwgYXMgc29vbiBhcyBzaWxpY29uIGd1eXMgY29tZSBpbiBhbmQgc2VlIGhv
dwpjb21wbGljYXRlZCBhbmQgZXhwZW5zaXZlIHlvdXIgYXBwcm9hY2ggYmVjb21lcy4KCj4gQmVj
YXVzZSB5b3VyIHZlcnNpb24gb2YgdGhlIGNvZGUgYW5kIHNwZWMgd2VyZW4ndCBnb29kIGVub3Vn
aCBmb3IgZXZlcnlvbmUuCgpBZ2FpbiwgcGxlYXNlIHRlbGwgbWUgd2hhdCBleGFjdGx5IHdhcyBu
b3QgImdvb2QgZW5vdWdodCIgYW5kIHdobwpleGFjdGx5IGlzICJldmVyeW9uZSIuCgo+IFlvdSBu
ZWVkIHRvIGFjY2VwdCB0aGF0IGNoYW5nZXMgdG8gdGhhdCBhcmUgaW5ldml0YWJsZSBzaW5jZSB0
aGVyZSAKCllvdSBzb3VuZCBsaWtlIGEgcG9saXRpY2lhbiB0aGF0IHRyaWVzIHRvIHB1c2ggYW4g
aGlkZGVuIGFnZW5kYSwKbWFkZSBieSBzb21lIHNlY3JldCBpbnRlcmVzdCBncm91cCBpbiB0aGUg
YmFjayByb29tLCBhZ2FpbnN0IHRoZQpwZW9wbGUgLSBsaWtlICJyZXNpc3RhbmNlIGlzIGZ1dGls
ZSIuCgoKRmluYWxseSwgcGxlYXNlIHRlbGwgbWUgd2hhdCBleGFjdGx5IHlvdSdyZSBtaXNzaW5n
IHNvIGhhcmQgaW4gbXkgc3BlYywKdGhhdCByZWFsbHkgbmVlZHMgYSBjb21wbGV0ZWx5IGRpZmZl
cmVudCBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggaXMgaGFyZAphbmQgZXhwZW5zaXZlIHRvIGltcGxl
bWVudCBpbiBoYXJkd2FyZS4KCgoKLS1tdHgKCi0tIAotLS0KSGlud2VpczogdW52ZXJzY2hsw7xz
c2VsdGUgRS1NYWlscyBrw7ZubmVuIGxlaWNodCBhYmdlaMO2cnQgdW5kIG1hbmlwdWxpZXJ0Cndl
cmRlbiAhIEbDvHIgZWluZSB2ZXJ0cmF1bGljaGUgS29tbXVuaWthdGlvbiBzZW5kZW4gU2llIGJp
dHRlIGlocmVuCkdQRy9QR1AtU2NobMO8c3NlbCB6dS4KLS0tCkVucmljbyBXZWlnZWx0LCBtZXR1
eCBJVCBjb25zdWx0CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5n
CmluZm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
