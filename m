Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E5C606A31D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QbGdSE2X;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NHMlZgXc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l72hTtqI1qr0fGViuuHxju3fjIAthElcws7lTyjNmpk=; b=QbGdSE2XG23rleBzoZ+P2UqUjY
	oYCDHsDYG63a/jkZon3z2FaqNH0oNNeBvXEpdMMDb14GqsXhs0sOqGoG/Z5TuHGmFPCg6fw4ubRB4
	mJIGYN+gFmO6AB0Sw7/NOU65nQH2n7r4yFQ1MEGwGxtd1syJZbtws2p/lC7Xy46r+LUlU88OhEwct
	TnnIIIO3b6fCJBVSgNMu3eE+zP6xsKcnIf7nONO1vU7Uj6p1eWcEe65GRga9pn6ZwKeOfb5RJtwI+
	btCK1T0gbODeTyvUhU3G7OVZbCP23Rjl1NOfR7sZBTTgMyif7VLHdo1zMDW5BbJRbdq3/SNISEagD
	45Rb8slQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsUt-0000000E8bj-1kbU;
	Thu, 22 Oct 2026 13:06:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsUr-0000000E8b6-16v8
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 13:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792674376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxaVeA9dwlfGvtK81Fy9yy2UTm6OUnIBULBY7N9vAQU=;
	b=NHMlZgXccQ1p/KvazMQlsKs58qLFBriYPkfu/Nd+OF0NZV1K4CiKvMbjy6j/x46hnK/Uhk
	pc+7tXTTG7AtYrEMns1nHHj7TDXNU9U2e/O0B4q3J4QWyBD4+rQJzq2S/HEG5ZkM4GQGDR
	x7P4Dq6nAD0JyYVCUvk0gzUDHxGAdhs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-r0NabarHOwa2TzsQjj3FIA-1; Thu, 22 Oct 2026 13:06:12 +0000
X-MC-Unique: r0NabarHOwa2TzsQjj3FIA-1
X-Mimecast-MFC-AGG-ID: r0NabarHOwa2TzsQjj3FIA_1792674371
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0af48c18so1559121f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 06:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674371; x=1793279171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxaVeA9dwlfGvtK81Fy9yy2UTm6OUnIBULBY7N9vAQU=;
        b=qOGNsWmh9M6n5iJhZ7DJXFZYB8tdEFdTliGA3YoZrbsAlOw/C2l4AJoY2J+57EUqhp
         TjYJn5imrZ/TuqMzX2BmIy+L62hCn8UMAjIa7YMme1NrIEsDoxmDOsqtEnNb2b7A7V0d
         utFr/95e97OG2ymyHD+m8jy5v6c78NGQ2BaM6PyRJKGHfQk3pSE2LLw7QZH6tw2DE9y1
         QchJr16kmiEllOUo+NmNkvPVCQpaCccM5rQPGoFET1qrPKfuUnqXzfzkCqQA/1FFutrC
         yC6kpC4pv0qQUiXnUoOgDmuJUoqaWqbGnkSTXvxU/hhR3HplKWVS6qo/JQayu4OuOS1S
         JCMw==
X-Forwarded-Encrypted: i=1; AKwUvByxuWEYgmFCdxtKBXEQlIqvAItzEg0YDUn5xk7He14cdU0jDDDFvA8zLIsNgavl0w5m2/et2VqpP3cxvw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJlykCvkRqR3srznKcLHhX3aNFUXH2rrsOVWPrCeIGREuGTlBkn
	bjM40jb48TrJ6fH6p68GIq9CHiLTIW7ULlCIl0G0gpkOPxxOeo2iYs8Ko50nU7CJyYwx6RzDjad
	xZYDZ6YTdG1otvrkP++to3A3QjqRnXgiDb/Q/Q5CSdcI8c0zWMYGRQt4IsYFbashh6yYwiX7Dsx
	U6rx3+0Mr7+9JNvaDDvrWK9w1QNX/ZA3GWzO3v1iKCLMiK
X-Gm-Gg: AYBFou11FAWnjjFYXxBP+pXuD4K/qCeogYHuntgcI/GOZyb0WsnXQlauQYr3ihkTwkF
	mgKzdNJ1/SadmPmHLx2Y7dnD5WbPv631abUKf8mto8kms1rBAAefgL+Q/feR/1tURwiqWAjUqr2
	zK9w079R/C3B3svTEwhSWDSIBKu28n5SyNqAKoUakdYWWHicW0Z2RxwAeVz3yzkgsB7i4D8SDNy
	gPs6bGEu4ZVejrixHgrmHRY/0MWQibb6zwImg0qEZe+75AjiiOuVQDj66prYQ==
X-Received: by 2002:a5d:6f04:0:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48e264e5a1amr10387230f8f.47.1792674371370;
        Thu, 22 Oct 2026 06:06:11 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:48a:fb1c:c2a1 with SMTP id
 ffacd0b85a97d-48e264e5a1amr10387172f8f.47.1792674370977; Thu, 22 Oct 2026
 06:06:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
In-Reply-To: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Oct 2026 15:05:58 +0200
X-Gm-Features: AclHuK_RpyhykSoyERIoG3foVlRnMgmZP9P6H-hF9JVROR7Ewx-6kuXhcSsJSlg
Message-ID: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 7.4
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YG-VBvtvj_mjemWp10IL9bX5bcRP9nq0No3Xyn_WePY_1792674371
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_060617_662633_E0256CEC 
X-CRM114-Status: GOOD (  12.20  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgMjo1MeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBJIHdhcyBvbiB2YWNhdGlvbiBsYXN0
IHdlZWs7IGhlbmNlLCBJIGFtIHNlbmRpbmcKPiB0aGUgS1ZNIFJJU0MtViA3LjQgUFIgYSBiaXQg
bGF0ZS4gQXBvbG9naWVzIGZvcgo+IHRoZSBpbmNvbnZlbmllbmNlLgoKVGhlIHByb2JsZW0gaXMg
bm90IHRoZSBQUiwgaXQncyB0aGF0ICpub25lKiBvZiB0aGVzZSBjaGFuZ2VzIHdlcmUgaW4KbGlu
dXgtbmV4dCB1bnRpbCB5ZXN0ZXJkYXkuICBUaGlzIGlzIG5vdCB0aGUgZmlyc3QgdGltZSB0aGF0
IEkgbm90aWNlCnRoaXMgYW5kIHJlbWluZCB5b3Ugb2YgaXQuLi4KClRoZXNlIGFyZSA4MCUgYnVn
Zml4ZXMgb3Igb3RoZXJ3aXNlIG5vdCBuZXcgZmVhdHVyZXMgKGUuZy4gMy80LzUvNiBpbgp0aGUg
bGlzdCBiZWxvdyB3b3VsZCBiZSBmaW5lIGV2ZW4gZm9yIC1yY04pLCBzbyBJJ2xsIHB1bGwKbmV2
ZXJ0aGVsZXNzLiBCdXQgKnBsZWFzZSogdHJ5IHRvIGNvbW1pdCBzdHVmZiBhcyBzb29uIGFzIGl0
J3MgcmVhZHkhCgpQYW9sbwoKPgo+IFdlIGhhdmUgdGhlIGZvbGxvd2luZyBLVk0gUklTQy1WIGNo
YW5nZXMgZm9yIDcuNDoKPiAxKSBMYXp5IFYtZXh0ZW5zaW9uIGVuYWJsZW1lbnQgZm9yIEtWTSBz
ZWxmdGVzdHMKPiAyKSBJbXBsZW1lbnQgS1ZNX1BSRV9GQVVMVF9NRU1PUlkgaW9jdGwoKSBhbmQg
ZW5hYmxlIGNvcnJlc3BvbmRpbmcgS1ZNIHNlbGZ0ZXN0cwo+IDMpIFNob3cgc2VwYy9zY2F1c2Uv
c3R2YWwgQ1NScyBpbiBLVk0gc2VsZnRlc3RzIHZjcHUgZHVtcAo+IDQpIFVzZSBhIHJhdyBsb2Nr
IGZvciBJTVNJQyB3YWtldXAgc3RhdGUKPiA1KSBSZWplY3QgdkNQVSBjcmVhdGlvbiBhZnRlciBB
SUEgaW5pdGlhbGl6YXRpb24KPiA2KSBVcGRhdGVkIG5leHQgYnJhbmNoIG5hbWUgaW4gS1ZNL3Jp
c2N2IE1BSU5UQUlORVJTIGVudHJ5Cj4gNykgQWxsb3cgWmljY2xzbSwgWmljY2Ftb2EsIFppY2Np
ZiwgWmE2NHJzIGZvciBLVk0gZ3Vlc3QKPgo+IEluIGFkZGl0aW9uIHRvIHRoZSBhYm92ZSwgd2Ug
YWxzbyBoYXZlIHRoZSBmb2xsb3dpbmcgZml4ZXMKPiBhbmQgbWlub3IgaW1wcm92ZW1lbnRzOgo+
IDEpIEF2b2lkIHJlZHVuZGFudCBpbnRlcnJ1cHQgY2hlY2sgZm9yIHBlbmRpbmcgdGltZXJzCj4g
MikgRml4IGJ1aWxkIHdpdGggdmVjdG9yIHN1cHBvcnQgZGlzYWJsZWQKPiAzKSBGaXggSVBJIGRl
bGl2ZXJ5IGZvciBvdXQtb2Ytb3JkZXIgdmNwdV9pZAo+IDQpIFJlcGxhY2UgaW1zaWMgc3dpdGNo
LWNhc2UgbWFjcm9zIHdpdGggcmFuZ2UgY2hlY2tzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
