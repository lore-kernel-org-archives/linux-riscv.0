Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A13EC74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yf1yqMJCVSWxSYlN822AF8j1oGe/Y2nsFyYES5LJXqo=; b=XO1hpnnOwnF5ws
	vdpOcgdafdEW8f2BvbV7hsG/OXZ8i0vQATKKdW4peWwYTAP+AQ1Bs6zzvsVnRdMppADINWXVmULCp
	HNjhQExTvNZp/b2Z8PYPNIKQOpw/qE6YRyh3F0NR17/62TA1pE4zxWcpHipFS/cogcZBRRtKRRPMG
	tkJp2woU5U4wRd7CMaXj3Lij3U+5QA4dx/SnVbNX+LW8jDJnsZGrcJPfwGRKOb7s9V43vafRTlXZD
	ZTXkG2M25nBsweekWlmcUTuM2eVfHp4YEzFv5EMRBFTPVFjF2xnX2itayfWfxpvKLeYqzlxeLK0Qo
	GzFknM9KbYTaYwkKdN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pefNM-00D9pS-39;
	Tue, 21 Mar 2023 17:02:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pefNJ-00D9og-07
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 17:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679418134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ho/MkDDhxFKmrwC0iiq6Sx1XjzmlAyM/mNn4nWOq2f0=;
	b=VkDBg3L6fClBuWnRUZ8RmumLUqvkIR2CRS5eLKcwehGdZhTZyNPdMB2JSt1B0RhVXiBWXa
	YLO9UMG5CrnQEcAEJB2/SRgR9l6ax0f98oR6iaC1C+TgHimI9zOvJpem+W+Y5MhzyrBws1
	Ih6iDScGm9jAC9u3zIzL/T3kXJayqsQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-u3CcHGCUPqiryGKNhL7gKw-1; Tue, 21 Mar 2023 13:02:13 -0400
X-MC-Unique: u3CcHGCUPqiryGKNhL7gKw-1
Received: by mail-qk1-f198.google.com with SMTP id c80-20020ae9ed53000000b007468c560e1bso2758645qkg.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 10:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho/MkDDhxFKmrwC0iiq6Sx1XjzmlAyM/mNn4nWOq2f0=;
        b=0h5L6emw87c2D79O7tn+c4BvfJ57fLIe5JmvzhGT/oIcK+OaETXCixLroZBilGwiMy
         0t9UktqJmb6HE1BhudCytSJbTAoMZMcxT3o0jSDflnJJ2Y3PKwJD5tchzAQGh6Zpo6HZ
         RuE5A1gq2NrwRmmnf1NvimrFGuYgRx1EEBqYgvng3DMvM5z93Md0PNKNzGuf/SrSwphJ
         9CYRkGBcqmMq1CyZGdfU/oaEuCmzBHIyg3UX22dSfAyqD6/0BpbiGPBAgFKVdsQ+pLZK
         AgeJRrhjbsnfhHReDUGv3pPJFHiXvACaKyf0D1sXuCyOQV2P5uhdR057pD/qjM6GnnH4
         HmBQ==
X-Gm-Message-State: AO0yUKWlKccRltPE/VdlgSwHLVU5NBFzBcJ4ZH1hzEch/HHmYZOlOZDE
	4jEmu5vAocLO+4c0Id9eeO6NB+ySt7m98TYU2p8CUT4D9+2E4LGEMBSastqpE8RnLjUhAqN1wGJ
	S1mJO2W/TuHQYZ1X/kMXBmk1iidTt10/TZ7M5/aNwcxMS
X-Received: by 2002:a05:620a:99b:b0:746:7701:adc6 with SMTP id x27-20020a05620a099b00b007467701adc6mr83470qkx.15.1679418131732;
        Tue, 21 Mar 2023 10:02:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set+FU09tlKowZp3MqkTFriSfnCbbirqmiRsT1Sq8rUKBNylhVkzT4U9TLQte5ISgz90D40NefdWf/i7ObG/cCWk=
X-Received: by 2002:a05:620a:99b:b0:746:7701:adc6 with SMTP id
 x27-20020a05620a099b00b007467701adc6mr83463qkx.15.1679418131346; Tue, 21 Mar
 2023 10:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230318080059.1109286-1-leobras@redhat.com> <8f698f49-135a-4263-8471-96f406919cb1@spud>
 <4f35f41c143b02b6b815e7eb527ca3acd8b4aabe.camel@redhat.com> <18e07d0a-7e21-46d0-9166-6ee07817352a@spud>
In-Reply-To: <18e07d0a-7e21-46d0-9166-6ee07817352a@spud>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 21 Mar 2023 14:01:59 -0300
Message-ID: <CAJ6HWG5zHMB1-vVsuQ+nG3EC12JAi2MP5o8GbSQ9QJfgLEQNnw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Deduplicating RISCV cmpxchg.h macros
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_100217_170311_B36F2C77 
X-CRM114-Status: GOOD (  47.03  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNDo0OeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgMDM6
MzA6MzVBTSAtMDMwMCwgTGVvbmFyZG8gQnLDoXMgd3JvdGU6Cj4gPiBIZWxsbyBDb25vciwgdGhh
bmtzIGZvciB0aGUgZmVlZGJhY2shCj4gPgo+ID4KPiA+IE9uIFN1biwgMjAyMy0wMy0xOSBhdCAy
MDozNSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBTYXQsIE1hciAxOCwgMjAy
MyBhdCAwNTowMDo1NEFNIC0wMzAwLCBMZW9uYXJkbyBCcmFzIHdyb3RlOgo+ID4gPiA+IFdoaWxl
IHN0dWR5aW5nIHJpc2N2J3MgY21weGNoZy5oIGZpbGUsIEkgZ290IHJlYWxseSBpbnRlcmVzdGVk
IGluCj4gPiA+ID4gdW5kZXJzdGFuZGluZyBob3cgUklTQ1YgYXNtIGltcGxlbWVudGVkIHRoZSBk
aWZmZXJlbnQgdmVyc2lvbnMgb2YKPiA+ID4gPiB7Y21wLH14Y2hnLgo+ID4gPiA+Cj4gPiA+ID4g
V2hlbiBJIHVuZGVyc3Rvb2QgdGhlIHBhdHRlcm4sIGl0IG1hZGUgc2Vuc2UgZm9yIG1lIHRvIHJl
bW92ZSB0aGUKPiA+ID4gPiBkdXBsaWNhdGlvbnMgYW5kIGNyZWF0ZSBtYWNyb3MgdG8gbWFrZSBp
dCBlYXNpZXIgdG8gdW5kZXJzdGFuZCB3aGF0IGV4YWN0bHkKPiA+ID4gPiBjaGFuZ2VzIGJldHdl
ZW4gdGhlIHZlcnNpb25zOiBJbnN0cnVjdGlvbiBzdWZpeGVzICYgYmFycmllcnMuCj4gPiA+ID4K
PiA+ID4gPiBJIHNwbGl0IHRob3NlIGNoYW5nZXMgaW4gMyBsZXZlbHMgZm9yIGVhY2ggY21weGNo
ZyBhbmQgeGNoZywgcmVzdWx0aW5nIGEKPiA+ID4gPiB0b3RhbCBvZiA2IHBhdGNoZXMuIEkgZGlk
IHRoaXMgc28gaXQgYmVjb21lcyBlYXNpZXIgdG8gcmV2aWV3IGFuZCByZW1vdmUKPiA+ID4gPiB0
aGUgbGFzdCBsZXZlbHMgaWYgZGVzaXJlZCwgYnV0IEkgaGF2ZSBubyBpc3N1ZSBzcXVhc2hpbmcg
dGhlbSBpZiBpdCdzCj4gPiA+ID4gYmV0dGVyLgo+ID4gPiA+Cj4gPiA+ID4gUGxlYXNlIHByb3Zp
ZGUgY29tbWVudHMuCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MhCj4gPiA+ID4gTGVvCj4gPiA+ID4K
PiA+ID4gPiBMZW9uYXJkbyBCcmFzICg2KToKPiA+ID4gPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVw
bGljYXRlIGNtcHhjaGcoKSBhc20gZnVuY3Rpb25zCj4gPiA+ID4gICByaXNjdi9jbXB4Y2hnOiBE
ZWR1cGxpY2F0ZSBjbXB4Y2hnKCkgbWFjcm9zCj4gPiA+ID4gICByaXNjdi9jbXB4Y2hnOiBEZWR1
cGxpY2F0ZSBhcmNoX2NtcHhjaGcoKSBtYWNyb3MKPiA+ID4KPiA+ID4gPiAgIHJpc2N2L2NtcHhj
aGc6IERlZHVwbGljYXRlIHhjaGcoKSBhc20gZnVuY3Rpb25zCj4gPiA+Cj4gPiA+IEZXSVcsIHRo
aXMgcGF0Y2ggc2VlbXMgdG8gYnJlYWsgdGhlIGJ1aWxkIHByZXR0eSBiYWRseToKPiA+ID4gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMw
MzE4MDgwMDU5LjExMDkyODYtNS1sZW9icmFzQHJlZGhhdC5jb20vCj4gPgo+ID4gVGhhbmtzIGZv
ciBwb2ludGluZyBvdXQhCj4gPgo+ID4gSXQgd2FzIGFuIGludGVybWVkaWFyeSBlcnJvcjoKPiA+
IFN1Zml4IGZvciBhbW9zd2FwIG9uIGFjcXVpcmUgdmVyc2lvbiB3YXMgImQuYXFybCIgaW5zdGVh
ZCBvZiB0aGUKPiA+IGNvcnJlY3QiLmQuYXFybCIsIGFuZCB0aGF0IGNhdXNlZCB0aGUgZmFpbC4K
PiA+Cj4gPiBJIGRpZCBub3Qgbm90aWNlIGFueXRoaW5nIGJlY2F1c2UgdGhlIG5leHQgY29tbWl0
IG1hZGUgaXQgbW9yZSBnZW5lcmFsLCBhbmQgdGh1cwo+ID4gcmVtb3ZlZCB0aGlzIGxpbmUgb2Yg
Y29kZS4gSSB3aWxsIHNlbmQgYSB2Mi1SRkMgc2hvcnRseS4KPiA+Cj4gPiBJIHNlZSB0aGF0IHBh
dGNoIDQvNiBoYXMgNSBmYWlscywgYnV0IG9uIGVhY2ggb25lIG9mIHRoZW0gSSBjYW4gc2VlOgo+
ID4gIkk6IGJ1aWxkIG91dHB1dCBpbiAvY2kvd29ya3NwYWNlL1suLi5dIiwgb3IKPiA+ICIiSTog
YnVpbGQgb3V0cHV0IGluIC90bXAvWy4uLl0iLgo+Cj4gSSBkb24ndCBwdXNoIHRoZSBidWlsdCBh
cnRpZmFjdHMgYW55d2hlcmUsIGp1c3QgdGhlIGJyaWVmIGxvZ3MgLQo+IGFsdGhvdWdoIHRoZSAi
ZmFpbGVkIHRvIGJ1aWxkIiBsb2cgaXNuJ3QgdmVyeSBoZWxwZnVsIG90aGVyIHRoYW4gdGVsbGlu
Zwo+IHlvdSB0aGUgYnVpbGQgYnJva2UuCj4gVGhhdCBzZWVtcyBsaWtlIGEgYnVnIHcuci50LiB3
aGVyZSB0dXhtYWtlIHByaW50cyBpdHMgb3V0cHV0LiBJJ2xsIHRyeQo+IHRvIGZpeCB0aGF0LgoK
VGhhbmtzIGZvciB0aGF0IDopCgo+Cj4gPiBJIGNvdWxkIG5vdCBmaW5kIGFueSByZWZlcmVuY2Ug
dG8gd2hlcmUgdGhpcyBpcyBzYXZlZCwgdGhvdWdoLgo+ID4gQ291bGQgeW91IHBvaW50IHdoZXJl
IGNhbiBJIGZpbmQgdGhlIGVycm9yIG91dHB1dCwganVzdCBmb3IgdGhlIHNha2Ugb2YgZnVydGhl
cgo+ID4gZGVidWdnaW5nPwo+ID4KPiA+ID4KPiA+ID4gUGF0Y2hlcyAxICYgNSBhbHNvIGFkZCBx
dWl0ZSBhIGxvdCBvZiBzcGFyc2UgaXNzdWVzIChsaWtlIDEwMDApLCBidXQgSQo+ID4gPiB0aGlu
ayB0aGF0IG1heSBiZSBtb3JlIG9mIGFuIGFydGlmYWN0IG9mIHRoZSB0ZXN0aW5nIHByb2Nlc3Mg
YXMgb3Bwb3NlZAo+ID4gPiB0byBzb21ldGhpbmcgY2F1c2VkIGJ5IHRoaXMgcGF0Y2hzZXQuCj4g
Pgo+ID4gRm9yIHRob3NlIEkgY2FuIHNlZSB0aGUgYnVpbGQgb3V0cHV0IGRpZmZzLiBCb3RoIGFk
ZGVkIGVycm9yIGxpbmVzIHRvCj4gPiBjb25jaHVvZC9idWlsZF9ydjY0X2djY19hbGxtb2Rjb25m
aWcuCj4gPiBJIHRyaWVkIHRvIG1pbWljIHRoaXMgd2l0aCBbbWFrZSBhbGxtb2Rjb25maWcgKyBn
Y2MgYnVpbGQgd2l0aAo+ID4gQ1JPU1NfQ09NUElMRT1yaXNjdjY0LWxpbnV4LWdudS0gXSBidXQg
SSBjb3VsZCBub3QgZ2V0IGFueSBlcnJvciBpbiBhbnkgcGF0Y2guCj4KPiBJZiB5b3UgY2FuJ3Qg
cmVwbGljYXRlIHRoZW0sIGl0J3MgcHJvYmFibHkgYmVjYXVzZSB0aGV5IGNvbWUgZnJvbQo+IHNw
YXJzZS4gSSBvbmx5IHJlYWxseSBtZW50aW9uZWQgaXQgaGVyZSBpbiBjYXNlIHlvdSB3ZW50IGxv
b2tpbmcgYXQgdGhlCj4gb3RoZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIGFuZCB3ZXJlIHdvbmRl
cmluZyB3aHkgdGhpbmdzIHdlcmUgc28gYW1pc3MuCgpPaCwgaXQgbWFrZXMgc2Vuc2UuCgo+Cj4g
PiBGb3IgcGF0Y2ggMS82IGl0IHJlbW92ZXMgYXMgbXVjaCBlcnJvciBsaW5lcyAoLSkgYXMgaXQg
YWRkcyAoKyksIGFuZCB0aGUgZXJyb3IKPiA+IG1lc3NhZ2VzIGFyZSBtb3N0bHkgdGhlIHNhbWUs
IGFwYXJ0IGZvciBhbiBsaW5lIG51bWJlci4KPgo+IEkgZG9uJ3Qgc2VlIGEgbGluZSBudW1iZXIg
ZGlmZmVyZW5jZSwgYnV0IHJhdGhlciBhbiBpbmNyZWFzZSBpbiB0aGUKPiBudW1iZXIgb2YgdGlt
ZXMgdGhlIHNhbWUgZXJyb3IgbGluZXMgaGF2ZSBhcHBlYXJlZCBpbiB0aGUgb3V0cHV0Lgo+IEkg
ZG9uJ3QgZmluZCB0aGUgc2luZ2xlLWxpbmUgb3V0cHV0IGZyb20gc3BhcnNlIHRvIHJlYWxseSBi
ZSB2ZXJ5Cj4gaGVscGZ1bCwgSSBzaG91bGQgcHJvYmFibHkgaGF2ZSBhIGJpdCBvZiBhIHRoaW5r
IGhvdyB0byBwcmVzZW50IHRoYXQKPiBpbmZvcm1hdGlvbiBiZXR0ZXIuCgpPaCwgSSBzZWUuClRo
ZSBudW1iZXIgYXQgdGhlIGJlZ2lubmluZyByZWxhdGVzIHRvIHRoZSBudW1iZXIgb2YgdGltZXMg
dGhlIGVycm9yIGhhcHBlbnMuCk9rIGl0IG1ha2VzIHNlbnNlIHRvIG1lIG5vdyA6KQoKPgo+ID4g
Rm9yIHBhdGNoIDUvNiBpdCBhY3R1YWxseSBhZGRzIG1hbnkgbW9yZSBsaW5lcywgYnV0IHRyYWNr
aW5nIChzb21lIG9mKSB0aGUKPiA+IGVycm9ycyBnYXZlIG1lIG5vIGlkZWEgd2h5Lgo+Cj4gUHJv
YmFibHkganVzdCBzcGFyc2UgYmVpbmcgdW5oYXBweSB3aXRoIHNvbWUgd2F5IHRoZSBtYWNyb3Mg
d2VyZQo+IGNoYW5nZWQgLSBidXQgc29tZSBvZiBpdCAoIlNob3VsZCBpdCBiZSBzdGF0aWM/IiBi
aXRzKSBsb29rIHZlcnkgbXVjaAo+IGxpa2UgdGhlIHBhdGNoIGNhdXNpbmcgdGhpbmdzIHRvIGJl
IHJlYnVpbHQgb25seSBmb3IgdGhlICJhZnRlciB0aGUKPiBwYXRjaCIgYnVpbGQsIGJ1dCBzb21l
aG93IG5vdCBmb3IgdGhlICJiZWZvcmUiIGJ1aWxkLgoKSHVtbSwgbm90IHN1cmUgSSBjb3VsZCB1
bmRlcnN0YW5kIHRoYXQgbGFzdCBwYXJ0OgpXaGF0IEkgZ2V0IGlzIHRoYXQgdGhlIHBhdGNoIDUv
NiBpcyBjYXVzaW5nIHRoaW5ncyB0byBiZSByZWJ1aWx0LCBhbmQKaXQgd2FzIG5vdCBsaWtlIHRo
YXQgb24gMS00LzYuCklzIHRoYXQgd2hhdCB5b3Ugc2FpZD8KSWYgc28sIGFuZCB5b3UgYXJlIGRv
aW5nIGl0IGFzIGFuIGluY3JlbWVudGFsIGJ1aWxkLCBjaGFuZ2luZyB0aGUKbWFjcm9zIGluIDUv
NiBzaG91bGQgYmUgdHJpZ2dlcmluZyByZWJ1aWxkcywgYnV0IGl0IGRvZXMgbm90IG1ha2UKc2Vu
c2UgdG8gbm90IGJlIHJlYnVpbHQgaW4gMS00LzYgYXMgdGhleSBjaGFuZ2UgdGhlIHNhbWUgbWFj
cm9zLgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shCgpCZXN0IHJlZ2FyZHMsCkxlbwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
