Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C90606A31A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u7Tx8nyy;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETmjCydf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YdwcPqKhQ2DL5xRy0pqG7T8YlypjmBRtEy1HM0ekTPc=; b=u7Tx8nyyOG5RKLjoYD+VOaoZvp
	6Dn0aTT1gtkLbL1ppc6w82fWsPwkY38+3I5nrTrM3BliOG3CdGNx+u1j/L9t0AEQFw4ZtYDPhVm20
	56KY4Hgb4CshZ4QvKVKj7C58/HwUBFAZqQWZr3nPa+14ltNy/O/xsGDVVgfNocWxH/rUpHBa0TwNe
	sCue6SqFsmb7OqTu7l5uKG4jjwOX7UfAHjsiAHb5A1ttYqLB3n4hmLAc7+FC7uNSeX0gktcOjWX8l
	pJDxNbRVvByLCBWHaZCgs/dIqgxM3EQp+zHqyl+mTa2AMz2v6Y3FGuvbMS9HmY6BzYFFo5xWfaFnL
	2tjgVrow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnDq-00000005gcc-3oE5;
	Tue, 27 Oct 2026 19:52:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnDo-00000005gcB-1WSd
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 19:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793130755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fj/41kyXVmvwyfVHkwSaPVRS80w5kPMmhzaFEoYT/ZQ=;
	b=ETmjCydfvdyy4pExGJNgjkBvNuhyLJZOVH8E5bZYJBaJW1y3Yax9kXwIeqFo+EyUQATyVP
	Ib+iasVEfsZ08YYADq1xbiZVI5c57jDYwjFB60N+9GlgLIODqgW3SyjIBJD7WlujTomRhj
	u1a+F3HRlqnN2g9+h7ohpwxPxNHi4Iw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-BNP5uVvRNKyN46DKwilhOg-1; Tue, 27 Oct 2026 15:52:33 -0400
X-MC-Unique: BNP5uVvRNKyN46DKwilhOg-1
X-Mimecast-MFC-AGG-ID: BNP5uVvRNKyN46DKwilhOg_1793130752
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e29c25101so106720f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2026 12:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793130752; x=1793735552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fj/41kyXVmvwyfVHkwSaPVRS80w5kPMmhzaFEoYT/ZQ=;
        b=QvsOiJs818odrSQNUxj5WwS/s/PVItHu3LgnNgtq5QJiOo6loUjxuFVS76J9IQ+YyY
         3tsWdnM7B9f+oaZIol/6tz4OSJYTwsYBq0CgwhAebkYhJ7nhR4oABfMP6YuV2D7dDtGd
         calnn/IBzXG03amuWNai5j3YvF9/xEf1TAVVAeBFhbgoQPTr2I5898eGY0IEQmd/aCQt
         bkgFLj/DMs9wWccz5y1WhJxN7sShPVjw9OhKdHu2ngrwIdQgHAAA/7j+oZ1xeqGfE+KV
         ruX0v+IkETM/T6cAPvRItXlWgDU+dDYcpJHscthDT3Nkqu5AAJg/B9H0iMhVtHVVuV3y
         779A==
X-Forwarded-Encrypted: i=1; AKwUvBzAT+cNyjMQT3WAyf1yQjGkj9CQiMvHfcaGkXY9wW6VUcUD9yDItzBg7mB2har78Ui8LjCbDVVkWBHv6w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKNz9/EAkmUkVRGrMyG6l6IIZkE9QDSNOUi87w2L33I81hDrPIP
	nB+gfZapRMNNHYxabB914YBXw3vRS6aMTMXlFR1L/kHPftqz+PKUfIi25XXMQFhqaqatdeXtKJm
	LI8kFJKjnWKmIHtV5KY3OIcCP8eSxWWmfgk69djOi3XyQBrqYS/FKLMwK0tKMMbtQwMcyOTCvV2
	dDn4hpfG5aO0mEprFDQSYDUYBulN5yPyfA5gv1VDtuVj/y
X-Gm-Gg: AYBFou2luUTSXkriSkQYlBDFB1IVDLyP3Tc1BR2c1mHqerHlgN7FycDc/sCZtLaQ+mV
	BGceqf/g7HRME6e8a7BdDuWtKNQibJzV6LrNFPBikBUJA4998+9PaHKFEvTVf1Rith/kHqhQtXg
	xGT+WoFQhdbrzPsf77DMA3fSunt+0iou9TlC+UmNoGRs97QwxL1naRIIjR33eel15t3LH5tX0jd
	l2tRi7J7v5t4E/7Lg==
X-Received: by 2002:a05:600c:c16b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4a7b30425cbmr77123895e9.22.1793130752208;
        Tue, 27 Oct 2026 12:52:32 -0700 (PDT)
X-Received: by 2002:a05:600c:c16b:b0:4a7:b304:253e with SMTP id
 5b1f17b1804b1-4a7b30425cbmr77123575e9.22.1793130751844; Tue, 27 Oct 2026
 12:52:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com> <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 27 Oct 2026 15:52:20 -0400
X-Gm-Features: AclHuK8-hXL_DfAWcv7wadq_C65si-Ml2WAgbzPdgrocvKidGZ5VkAc-qEqFxfA
Message-ID: <CADRr4bctCf-7xBER1G2vqtQm2Nda+h222UzYShMQXw+rtBwPzA@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] perf tests: add noinline to __test_function
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org, 
	qingfang.deng@linux.dev, shuah@kernel.org, thecharlesjenkins@gmail.com, 
	cp0613@linux.alibaba.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3tM63a4RRN-rXNOKRHA94jvULweJCtv8q9MXgkvQhGE_1793130752
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125236_495882_92A5B6B4 
X-CRM114-Status: GOOD (  17.50  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgMjo0MOKAr0FNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBJbiB0aGUgYnJlYWtwb2lu
dCBzaWduYWwgaGFuZGxlciB0ZXN0LCBhIGJyZWFrcG9pbnQgaXMgc2V0IG9uCj4gX190ZXN0X2Z1
bmN0aW9uLiBDb21waWxlciBtYXkgb3B0aW1pemUgYW5kIGlubGluZSBfX3Rlc3RfZnVuY3Rpb24u
Cj4gVGhpcyBjYXVzZXMgZmFpbHVyZSBpbiB0aGUgdGVzdC4KPgo+IEFkZCBub2lubGluZSB0byBf
X3Rlc3RfZnVuY3Rpb24gc28gdGhhdCBpdCBpcyBub3QgaW5saW5lZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFuc2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4K
UmV2aWV3ZWQtYnk6IEplc3NlIFRhdWJlIDxqdGF1YmVwZUByZWRoYXQuY29tPgoKSSB3b3VsZCBy
ZXNlbmQgdGhpcyB0byB0aGUgcGVyZiBsaXN0IGFuZCBub3QgaW4gYSBwYXRjaCBzZXQgYXMgaXQg
aXMgYQpzZXBhcmF0ZSBmaXguCgpUaGVyZSBpcyBhbHNvIGFub3RoZXIgZml4IHRvIGRhdGFfYnJl
YWtwb2ludC5j4oCOIHRoYXQgaSBoYXZlIGJlZW4KbWVhbmluZyB0byBzZW5kIGhlcmU6Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9Nci1Cb3NzbWFuL2xpbnV4L2NvbW1pdC9kYjRmYWE1MmE2NmY2YjcyNjVj
ZDM5N2EyZDQ0ZDdkMzhjM2ZkZmI3CgpUaGFua3MsCkplc3NlIFRhdWJlCj4gLS0tCj4gIHRvb2xz
L3BlcmYvdGVzdHMvYnBfc2lnbmFsLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdGVzdHMv
YnBfc2lnbmFsLmMgYi90b29scy9wZXJmL3Rlc3RzL2JwX3NpZ25hbC5jCj4gaW5kZXggZjU4MGJh
NzQ4NmIxLi5jYzRhMjcyMjQ4ODQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9icF9z
aWduYWwuYwo+ICsrKyBiL3Rvb2xzL3BlcmYvdGVzdHMvYnBfc2lnbmFsLmMKPiBAQCAtNTQsNyAr
NTQsNyBAQCBhc20gKAo+ICAgICAgICAgInJldFxuIgo+ICAgICAgICAgIi5wb3BzZWN0aW9uXG4i
KTsKPiAgI2Vsc2UKPiAtc3RhdGljIHZvaWQgX190ZXN0X2Z1bmN0aW9uKHZvbGF0aWxlIGxvbmcg
KnB0cikKPiArc3RhdGljIG5vaW5saW5lIHZvaWQgX190ZXN0X2Z1bmN0aW9uKHZvbGF0aWxlIGxv
bmcgKnB0cikKPiAgewo+ICAgICAgICAgKnB0ciA9IDB4MTIzNDsKPiAgfQo+IC0tCj4gMi40My4w
Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
