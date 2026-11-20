Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B41606A338
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=joY8Y6yS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MzjCY2lj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fYk7XpoNqS7BrjTv5pyhUmAcjHbOSQnRsUwhbxTRPiM=; b=joY8Y6ySLapT8f5PuJpl01QyTq
	/nZV+dwIWmy/RQCEhqgoA+X/lkygRrkVqFNMaZs8Aqq8YeWbKMhPvF4eGzG1GT0C1OQ4TNV0sSAUt
	QiNASCLMq8VQd2nVl3WFuJUYF6F3TtRAfD4/zLgBw7yPMSNFiwIJjKWbIboCy1FTaFTyQFKKRowgz
	KPgg1QhNgXmePFdWPJklxjB3LpV21HQJkHOXYM0MPs3ywgIN6NTRJwcinFf5LqQ1UpmpPVknvVX7o
	SJfxmfJlWGEs5BxdngKTtbH70edJxAL3PHojYpjQ+QfT11qIqUoGaty+SxBj72WJFCVsuqust0d8P
	92FhzRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURsw-0000000FbEh-36sU;
	Fri, 20 Nov 2026 16:54:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURsu-0000000FbDm-0PeR
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 16:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795193685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoK52sV9iYkRCVLGrLj4ttkVHmfRaxoQO9rnKusqNO0=;
	b=MzjCY2ljjBG3EF+eVvW3DJDiAOv7hYc7w65OjPluQCIholsa7/uTNh/83uztghop686Gf+
	jlU/xGwpyYLcBQEmbdSgj1nukVyvQBJpyBditgaKnpmuPdOrDCVerswH2LG1SDkgLQN0Fm
	QbH+Q7L5As/Wgq8CW4lBm9yGR5vm/RM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-m7V4lRCPNwO92rXEEFDihA-1; Fri, 20 Nov 2026 16:54:43 +0000
X-MC-Unique: m7V4lRCPNwO92rXEEFDihA-1
X-Mimecast-MFC-AGG-ID: m7V4lRCPNwO92rXEEFDihA_1795193682
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1881019a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 08:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193682; x=1795798482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoK52sV9iYkRCVLGrLj4ttkVHmfRaxoQO9rnKusqNO0=;
        b=seT3ioqNRr4fXm1S4wD0z7MdRIOMKjna+/QuGwrzeR8f3nJMEhe78DDq+FJk1ZXcl1
         H+lBO9f0Yx2/NXo0pM+MOuAej7XhrNn8zpLfDG5KOTP241cFM1eDxhtMONboa86EMMFu
         t+8lucosBCvNJgNwz3l51FVYCrCuAbb2aVfBtILNMXthHVC21DiqNZ6ebQQx4iB8XPjb
         OCBzJe5JX77asMWt9eYhmPgu3F+EHZ/NSMrdijg1Qk8IeU7AzeNqdcyhofq24btfiJFp
         fI6mgs2Ot9iWAWCRminXcL1JITx9dAoQG75OUS9/O5j2C51RDbxDGcB5b6cVt2ipi1gY
         emrA==
X-Forwarded-Encrypted: i=1; AL+hErF59+vTCjh5oWJD1mzH/A+P8Pqtx7lqsQraZUFj3V2dUk0UCyF275s2zx7d5l4aWEgaAi4L/EeH7IgFjQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+A/DY4pJcFAhRmJ6XtQLtllWS6TQ+sZ+/c/Mx5KP0Uq6MMPi3r
	TGxMQcTk7glHDS8KKZByabYXn9RRwCxDL2Iud0aUOCZHl4NCqkcidmHs/vcGx0Bd6xo/iwRHAuV
	ma7Yi5pj6wHpd7ws4rl3eC8M1GLfDDb8adtfByowaiLhGI1pbU2XE5yBwbuBdfD55ESlJ08xO4f
	M/AK6KOnzSEU/KwqRXBG6bdO7Y4cPAUPEGo2HFs2GUX/jH
X-Gm-Gg: AZFdTZdqqcxG641wCWXhwM+T3CCgSZ7+CEocjzAeDDh1SKpk+9uCOTIGqezZqcM0ed+
	pEhJ2fQlOlZT1Bgs9T+SsbnDAMUABur0Y26fsL/ie43SOac1BBF62HkA4LYDzOO0QUevwt8WFQn
	dBPzHloj6HUeyQ5Y1LRm+G7UF2cnKy8Nm7F9Sy5w8zfVmyXiyhB9S2SqextXRKqJBXSWh0yPx8G
	lq75j+LwNvykB10n13cfPSPH4EpWLvLmrflB7g4V7WojYTSbQfHeHdXMCn18C8oVJyYRotY+8WQ
	xLPCEhPc5yS4uI85iofS
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b41c7bc5a5mr2651374a91.3.1795193682011;
        Fri, 20 Nov 2026 08:54:42 -0800 (PST)
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id
 98e67ed59e1d1-3b41c7bc5a5mr2651362a91.3.1795193681478; Fri, 20 Nov 2026
 08:54:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy32nAjcz2vyN37Fb7nKc9jbUxWjUYjiYGda7NPhweJhTw@mail.gmail.com>
In-Reply-To: <CAAhSdy32nAjcz2vyN37Fb7nKc9jbUxWjUYjiYGda7NPhweJhTw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Nov 2026 17:54:29 +0100
X-Gm-Features: AclHuK_cN9rwoorx-PqMlIeeT3j5FStKrFrMBtqWNaFqSpH_A-AQRm27GLu6w8M
Message-ID: <CABgObfaQNmyDgwRNdM7O5MbK=c-TB-GhAMzMR7ds_2oz0r9zwQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 7.4 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E_WW5Qh34RV6SXasS_sCw_ZEbENEZiJhQ3EF91-HJnU_1795193682
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_085448_276766_637A17D7 
X-CRM114-Status: GOOD (  14.79  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMjAsIDIwMjYgYXQgMTI6MjXigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aGUgZm9sbG93aW5n
IGZpeGVzIGZvciA3LjQga2VybmVsOgo+IDEpIFZhbGlkYXRlIEFJQSBNTUlPIGFkZHJlc3MgcmFu
Z2VzIGJlZm9yZSBBSUEgaXMgaW5pdGlhbGl6ZWQKPiAyKSBEaXNhbGxvdyBHUEEtd2lkdGggY2hh
bmdlcyBhZnRlciBBSUEgaXMgaW5pdGlhbGl6ZWQKPiAzKSBGaXggZG91YmxlIGZyZWUgb2YgdGhl
IHNwbGl0IHBhZ2UgY2FjaGUKPiA0KSBEbyBub3QgdG91Y2ggdGhlIGVudmNmZyBDU1JzIG9uIHRo
ZSBTaUZpdmUgUDU1MAo+ICAgICAoTm90ZTogU2lGaXZlIFA1NTAgaXMgYmFzZWQgb24gUHJpdiB2
MS4xMSBzbyBpdAo+ICAgICAgZG9lcyBub3QgaGF2ZSBlbnZjZmcgQ1NSIGhlbmNlIHRoaXMgZml4
KQo+IDUpIFNldCBBY2Nlc3NlZCBiaXQgaW4gZGlydHktbG9nIHdyaXRlIGZhdWx0IGZhc3QtcGF0
aAo+IDYpIFZhbGlkYXRlIFBNVSBjb3VudGVyIGluZm8gdXNpbmcgYXZhaWxhYmxlIGNvdW50ZXJz
Cj4gNykgRml4IEctc3RhZ2UgcGFnZSB0YWJsZSBtZW1vcnkgbGVhayBvbiBWTSBkZXN0cm95Cj4g
ICAgIChOb3RlOiBUaGlzIG9uZSB3YXMgYSBwcmV0dHkgZW1iYXJyYXNzaW5nIGlzc3VlCj4gICAg
ICB3aGljaCB3ZSB0b3RhbGx5IG1pc3NlZCBvdmVyIHRoZSB5ZWFycykKClB1bGxlZCwgdGhhbmtz
LgoKUGFvbG8KCj4KPiBQbGVhc2UgcHVsbC4KPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhZWJiNzI3NDQ3NjQwMzA0MGQ1ODJjNjE0Nzhk
ZjhmNGE3YmY5Y2QzOgo+Cj4gICBMaW51eCA3LjQtcmMzICgyMDI2LTExLTE1IDE0OjMwOjExIC0w
ODAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LWZpeGVz
LTcuNC0xCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZTliZjQ5YmJjNDIyNzA0
ODY4NWM3OGY5N2UxNDQ2ODQ1NzYwZGY0ZjoKPgo+ICAgUklTQy1WOiBLVk06IEZpeCBHLXN0YWdl
IHBhZ2UgdGFibGUgbWVtb3J5IGxlYWsgb24gVk0gZGVzdHJveQo+ICgyMDI2LTExLTE2IDE4OjA2
OjI1ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBmaXhlcyBmb3IgNy40LCB0YWtlICMx
Cj4KPiAtIFZhbGlkYXRlIEFJQSBNTUlPIGFkZHJlc3MgcmFuZ2VzIGJlZm9yZSBBSUEgaXMgaW5p
dGlhbGl6ZWQKPiAtIERpc2FsbG93IEdQQS13aWR0aCBjaGFuZ2VzIGFmdGVyIEFJQSBpcyBpbml0
aWFsaXplZAo+IC0gRml4IGRvdWJsZSBmcmVlIG9mIHRoZSBzcGxpdCBwYWdlIGNhY2hlCj4gLSBE
byBub3QgdG91Y2ggdGhlIGVudmNmZyBDU1JzIG9uIHRoZSBTaUZpdmUgUDU1MAo+IC0gU2V0IEFj
Y2Vzc2VkIGJpdCBpbiBkaXJ0eS1sb2cgd3JpdGUgZmF1bHQgZmFzdC1wYXRoCj4gLSBWYWxpZGF0
ZSBQTVUgY291bnRlciBpbmZvIHVzaW5nIGF2YWlsYWJsZSBjb3VudGVycwo+IC0gRml4IEctc3Rh
Z2UgcGFnZSB0YWJsZSBtZW1vcnkgbGVhayBvbiBWTSBkZXN0cm95Cj4KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gRGF2
aWRsb2hyIEJ1ZXNvICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogRG8gbm90IHRvdWNoIHRoZSBl
bnZjZmcgQ1NScyBvbiB0aGUgU2lGaXZlIFA1NTAKPgo+IExpIEppbnl1ZSAoMSk6Cj4gICAgICAg
UklTQy1WOiBLVk06IEZpeCBkb3VibGUgZnJlZSBvZiB0aGUgc3BsaXQgcGFnZSBjYWNoZQo+Cj4g
UGVuZ3BlbmcgSG91ICgyKToKPiAgICAgICBSSVNDLVY6IEtWTTogVmFsaWRhdGUgQUlBIE1NSU8g
YWRkcmVzcyByYW5nZXMKPiAgICAgICBSSVNDLVY6IEtWTTogRGlzYWxsb3cgR1BBLXdpZHRoIGNo
YW5nZXMgYWZ0ZXIgQUlBIGluaXQKPgo+IFFpbmd3ZWkgSHUgKDEpOgo+ICAgICAgIFJJU0MtVjog
S1ZNOiBWYWxpZGF0ZSBQTVUgY291bnRlciBpbmZvIHVzaW5nIGF2YWlsYWJsZSBjb3VudGVycwo+
Cj4gU2V1bmdKdSBDaGVvbiAoMSk6Cj4gICAgICAgS1ZNOiByaXNjdjogU2V0IEFjY2Vzc2VkIGJp
dCBpbiBkaXJ0eS1sb2cgd3JpdGUgZmF1bHQgZmFzdCBwYXRoCj4KPiBZYW5neXUgQ2hlbiAoMSk6
Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBHLXN0YWdlIHBhZ2UgdGFibGUgbWVtb3J5IGxlYWsg
b24gVk0gZGVzdHJveQo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwg
IDIgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgfCAgMSArCj4gIGFy
Y2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAgICAg
ICB8IDIyICsrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAgICAgICAg
ICAgICAgIHwgIDkgKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAg
ICB8IDEyICsrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICB8
ICA2ICsrKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfY29uZmlnLmMgICAgICAgIHwgMTYgKysr
KysrKy0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgICAgICAgIHwgIDIgKy0K
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jICAgICAgfCAyMCArKysrKysrKysrKy0t
LS0KPiAgYXJjaC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgICAgfCAgNSArKystCj4gIDEx
IGZpbGVzIGNoYW5nZWQsIDExOCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
