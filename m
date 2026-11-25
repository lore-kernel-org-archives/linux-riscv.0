Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36F606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P8dwB6wu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=dp2IWccw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=adCc12x4f+684d3oET7c7hhJV7rRb12fkNyMhWr9ugk=; b=P8dwB6wulzg6kavYGD0x2oxsng
	rmSJOvuOBQFk7wlA9mp0q+llXNrsSjKJAgE3jJQPyFysOOiWVr7dZp40WjWQ0nTSm18eRPECtQNVp
	WMwGEHWY89BN2zr0yJh+XdlZSHj5dNuLNmLOtL3oOrwu2yhWZuUHSP+KBTvtiQXekb3Ors7qfx5On
	UwxzQWoDtISYgHVOhRnRY4MgCSgBKIAwXhQ1jRQwVNfkZyFQkbC1vA7TRUHR+m6eVQmEvfYQBxeWr
	AOEekhAzkcOtqSIH7erlhy94fjJysGZ/9LpoAs442qWLcaXrwKvQkfT/CLC1g9rFQKFN2e1T3I1s3
	rxrKiViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tH-00000008UEL-17ZM;
	Wed, 25 Nov 2026 05:49:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tE-00000008UDS-2tLJ
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:49:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2422905f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:49:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585795; cv=none;
        d=google.com; s=arc-20260327;
        b=RLhrsVZBG1bcrCJF25+5MpIXfzASRf55Og31yuVIuMSW5J1iAQrUMtwIpA0R0i4/2u
         RrqVgBxGvxO1TtIqejORdSoFWfIRsYtw4DLS7CffxBZgwLCDWZev0jwMLWNdwoohkRgT
         QRF6xdlNOb4BlatgI9ijvxoOvpFWPaIB6vtXnyD2dYqlRWX3x8f3afpSOB7b8itq9U59
         bqBW7qADqYY7amI8m1oOPL+1dNpwo14TV7iNXS11g9vOJC45IcHbmS/tAbEVerx0r8f+
         OEPFgx5CkTkLkkmFQPwRnCu+gr2duYLbHUu0Ea19waSwb+x4D6IPoeW8XA+N42VIKPUG
         Wz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        fh=igjJGZ8rjm7rtNWbVel/EjpkfD+2KeludJ2Zg8SUjao=;
        b=oTZECiElkCycGDmFZcENtTnfdiir0IlI8rqG7pOpNkwTF/yP4o72ie0ExRBZ0yPHA0
         sQUP1bo2rPFXbOlR4QFgfd5AeMtpmxxwW2oiZwAXxCIOTENpr5fZ3EkZvMLNj84c9LQo
         GBxQS+KLXx4s27ykz4vP4rP2WnNzsgdlPkm6uKyc1ywbj11H/wax6BP2XEXt1QiBIUAM
         GHFWyWNzljoIF49toflU9wU0zmjHVm2GMSmouBgjITT1jhESwXBICs3BfO0iCaSZbCCg
         iIwiegbCFzRUEMjjrTeOYEqqiNhbPFRIflRNQeMfAPyd/tyuajDfXPgghaxnqSNFNVRG
         j7ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585795; x=1796190595; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        b=dp2IWccwF3CpQgarZ2zQXxTp+II0ifpMZK5xQxySQzsHuRuak/XI+eqyJa1dEVmWeW
         ttEABJCi8e23gnFB58G/+qRPpKbWkzlKroDTrrUnvTqHYsuAVFfjyUzVLpaPSVDj7R++
         +c/2vbcFDmoOCdew6zrXwtK8ZlApt4h5wWCEVATGTrpRErR7EJFtm6xgsIKX3UQ6SMQJ
         bKXHLKCAF17TVGkISwyxsGuOwah67cK0vBqSm6bLqGLlRWO89CP4X0Xcqk2GVf/jzYdE
         q7+uaF8y0ZkcldxiyaUCPHoFqGG9kEVHhSkomThWOKIQPSNcHUCbloJGyWIizB/PHjfL
         gg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585795; x=1796190595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        b=YiSwLn8zfE1cCLdZah06r7W6CoBIKgKIzjf7lUxSf53ASEJYjNeYvSdi+YNjHqIW/u
         BI6bXmxNU3meStXZxB2DZypfCauCSPncyehs/BzubBv4HMF3QwMtaclFQTxpcOjXFnRL
         oE+4Tc+XapG04ybTO6ItmsmRefO3FWEBrEiuU5PjCzok2nc8W/cg6V+kMxa1tKr7I4/C
         FzN/41kbuCaD0Kr74iLIwyxZuvJzZQu+9/jS8wR877l89DsCX7xxkg2NHD+zD6SMhBPl
         /iz9DsJTAamazjGkQ3qp9QQEkPKZI1zsINeTeJ1Y51k/La/7Rg4XuzasPQC668H8SMcZ
         2LuA==
X-Forwarded-Encrypted: i=1; AL+hErEHz40upb9g3EGxK7EOr4kvYLrm+aIl+Ge33PXJO7YMIvuCQL8If/DKcdWVkYJgvbkDeXpY5hdMHCWnZg==@lists.infradead.org
X-Gm-Message-State: APuU4Z98dvCHRI3rdlXhBFmP4wyG8rMXt8+Is7EhPly1JKd/YvsM4u8u
	ey5Gx51m19SZKA6arn03NI3UPxkh7rxrLD0+6cTCcrzgr81teimAoD/HJzmEeh1j8J688sJ6NZk
	AWfvfpf90D0jtc1eqw1kW7owlQJ/qPhU91ErhhnuMHg==
X-Gm-Gg: AZFdTZdd61E/BdBKP8XBSPfzW6iw8Qa72K0U9ueGh2fMLzDiIxTm5SYn736myQ9m0c0
	Rig5XN5S/LeO1/wbjUOHrtR+ZkV5pOnHpQ0NXrm+d95ghzR0ZOkP0fh/pNn64m99+8V/EKLJ7xT
	StIUqSThkT8AeanMYuQbuY/MGhJ8ApFHhKUO6F9bKaUcdNcIHcdb43JDV0+LyVuOzvKVwx4fzw/
	b0Y1fOdz9BuImxZn1H05mnthDfIITzE/kODYj0q4JDVu+Why8/O9bOJpryni9xTlzRCFf3GWwEL
	cU4emF1xs8IdFys6CK6N7enaff4cCjhMJxZpht9wIt0ZHn8ZX3+FewJ38jUm93wcvdFLgz0Gqz1
	FNiTyT20sIHAbUKCB/IFL6Ir4zhkxpTTGZKyA3N7WiiKVMa3aoCO0C9ujOz4Vet+vBPtLk71TLf
	42HCdSrR3AoSTisnW9WuZVpHlGxV0TY7yGewNvy36/4Jaer47HgNmDqB4=
X-Received: by 2002:a5d:6f13:0:b0:4a7:a7d2:eb45 with SMTP id
 ffacd0b85a97d-4abb6d04777mr28721728f8f.44.1795585794414; Tue, 24 Nov 2026
 21:49:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-2-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-2-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:43 +0530
X-Gm-Features: Aa3M54rM0lMmhvxe-VB9jSUcy69cdiFPwqZiJIiAYrdwNUAJS1EnS9yl8AAOxXc
Message-ID: <CAAhSdy0r1WzzK-0rik+qkofG6RWHw__KaYus7LTkGdF-4=fnaA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] KVM: riscv: Age all G-stage PTEs in a GFN range
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_214956_750858_53F06948 
X-CRM114-Status: GOOD (  13.97  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4ga3ZtX2FnZV9nZm4oKSBhbmQga3ZtX3Rlc3RfYWdlX2dm
bigpIG9ubHkgb3BlcmF0ZSBvbiB0aGUgRy1zdGFnZQo+IGxlYWYgY292ZXJpbmcgcmFuZ2UtPnN0
YXJ0LiBUaGV5IGFsc28gd2FybiB1bmxlc3MgdGhlIHJhbmdlIHNpemUgaXMKPiBleGFjdGx5IDRL
LCAyTSwgb3IgMUcuCj4KPiBUaGUgTU0gY2FuIHBhc3MgbGFyZ2VyIHJhbmdlcyB3aGVuIGJhdGNo
aW5nIHRoZSBQVEVzIG9mIGEgbGFyZ2UgZm9saW8uCj4gRm9yIGV4YW1wbGUsIGEgNjRLIG1USFAg
cmFuZ2UgdHJpZ2dlcnMgdGhlIHdhcm5pbmcgYW5kIG9ubHkgdGhlIGZpcnN0Cj4gNEsgbGVhZiBp
cyBhZ2VkLCBsZWF2aW5nIHRoZSBBY2Nlc3NlZCBiaXRzIG9mIHRoZSByZW1haW5pbmcgbGVhdmVz
Cj4gdW5jaGFuZ2VkLgo+Cj4gVGhpcyBjYW4gYmUgcmVwcm9kdWNlZCBvbiBhbiBydjY0IGhvc3Qg
d2l0aCBTdmFkdSBieSBkaXNhYmxpbmcgMk0gVEhQLAo+IGVuYWJsaW5nIDY0SyBtVEhQLCBhbmQg
cnVubmluZzoKPgo+IGFjY2Vzc190cmFja2luZ19wZXJmX3Rlc3QgLXMgYW5vbnltb3VzX3RocAo+
Cj4gVGhpcyByZXN1bHRzIGluOgo+Cj4gV0FSTklORzogYXJjaC9yaXNjdi9rdm0vbW11LmM6MzYy
IGF0IGt2bV9hZ2VfZ2ZuKzB4MjEwLzB4MzcwCj4gLi4uCj4gWzxmZmZmZmZmZjgwMGM4ZmM4Pl0g
a3ZtX2FnZV9nZm4rMHgyMTAvMHgzNzAKPiBbPGZmZmZmZmZmODAwOTVjOTA+XSBrdm1fbW11X25v
dGlmaWVyX2NsZWFyX3lvdW5nKzB4MjUwLzB4NDc4Cj4gWzxmZmZmZmZmZjgwYWU1MzJlPl0gX19t
bXVfbm90aWZpZXJfY2xlYXJfeW91bmcrMHhkZS8weDFhMAo+IFs8ZmZmZmZmZmY4MDkzMmY3Nj5d
IHdhbGtfcHVkX3JhbmdlKzB4ODZlLzB4MTY4OAo+IFs8ZmZmZmZmZmY4MGExODcyMD5dIHdhbGtf
cGdkX3JhbmdlKzB4NTE4LzB4MTdiMAo+IFs8ZmZmZmZmZmY4MGExOWFhMj5dIF9fd2Fsa19wYWdl
X3JhbmdlKzB4ZWEvMHg1ODAKPiBbPGZmZmZmZmZmODBhMWE0MjI+XSB3YWxrX3BhZ2VfcmFuZ2Ur
MHgzYS8weDgwCj4gWzxmZmZmZmZmZjgwOTMxZGMwPl0gdHJ5X3RvX2luY19tYXhfc2VxKzB4NTIw
LzB4ZTY4Cj4gWzxmZmZmZmZmZjgwOTM5ZGMwPl0gbHJ1X2dlbl9zZXFfd3JpdGUrMHhkMDgvMHgx
MzEwCj4KPiBXYWxrIGFsbCBHLXN0YWdlIGxlYXZlcyBpbiB0aGUgcmVxdWVzdGVkIHJhbmdlLiBB
ZHZhbmNlIGJ5IHRoZSBsZWFmCj4gc2l6ZSB3aGVuIGEgbWFwcGluZyBpcyBmb3VuZCwgb3IgYnkg
dGhlIHNpemUgb2YgdGhlIG5vbi1wcmVzZW50IHJlZ2lvbgo+IGF0IHRoZSBsZXZlbCB3aGVyZSB0
aGUgd2FsayBzdG9wcGVkLiBXaGVuIHRlc3RpbmcgdGhlIGFnZSwgcmV0dXJuIGFzCj4gc29vbiBh
cyBhIHlvdW5nIGxlYWYgaXMgZm91bmQuCj4KPiBSZW1vdmUgdGhlIHJhbmdlLXNpemUgd2Fybmlu
ZyBzaW5jZSBhcmJpdHJhcnkgR0ZOIHJhbmdlcyBhcmUgdmFsaWQuCj4KPiBGaXhlczogOTk1NTM3
MWNjMDE0ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBNTVUgbm90aWZpZXJzIikKPiBTaWduZWQt
b2ZmLWJ5OiBTZXVuZ0p1IENoZW9uIDxzdXVuajEzMzFAZ21haWwuY29tPgoKTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
