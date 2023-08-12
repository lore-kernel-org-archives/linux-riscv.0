Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F83C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Aug 2023 00:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIrsQI9AE2rva2QeSNr/8bxRsbB6eb/Yuak2DnqXZlA=; b=06qxeHR0MY9Hb5
	iyPmYMoO19wm2FS17D7LjYlI7sfilKjETNgz0pknciR+uStGTF8rv4TDL19zsb/0KXp9G/EnoRRFT
	rfdp3IgBhdKZB4nmH3yiPJBNv2++xtx5O9+rqfC/aeqixNtzGmIyBR9dPhEtnz/kbgnXor7shJnms
	5w0X4cop4DCU0fK8WJfauIniLqXfE0q5NK/GHx7XwSVeRuoTqGmhdGU5lKOkbjAnu3NFYzfRxskVC
	GCvqRyRujRFdGSjFeJZGCxzhu11X2ItPd0ESj2NdWzNgLTI6cUrVfjGiej3x4CGdNQlBvn+Ql1gun
	MJ0iPnFnHrI0jNF0ZlJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcnV-00CBF7-3D;
	Sat, 12 Aug 2023 00:48:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUcnS-00CBC6-2k
	for linux-riscv@lists.infradead.org;
	Sat, 12 Aug 2023 00:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691801279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLC/yOAR2d4wIWdWwjFchmmeIa+RdcqwrFVJ1+GuKDw=;
	b=DSftf1r6R9ofUoKiNNoQnHx9VcN+swtAsJW9R5ulCZZf/UjEqRllfJKisx+PVJsrDMYmFG
	cyUgokGCkr5rpWwPloMG7NdfF53yN5CqSuvdR28hos6WDi6dx7qtWH1gp4GcoNDkTAAJH8
	TIgJpmNQiolDYg/jHpmqjjuudhXOqgE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-lUtXwiZgPMmXVj5sVgtwdQ-1; Fri, 11 Aug 2023 20:47:54 -0400
X-MC-Unique: lUtXwiZgPMmXVj5sVgtwdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 918563C0ED49;
	Sat, 12 Aug 2023 00:47:53 +0000 (UTC)
Received: from [10.22.17.82] (unknown [10.22.17.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E04A2166B25;
	Sat, 12 Aug 2023 00:47:51 +0000 (UTC)
Message-ID: <2f84b806-193a-6d7c-71fe-cc718e9455f9@redhat.com>
Date: Fri, 11 Aug 2023 20:47:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V10 18/19] locking/qspinlock: Move pv_ops into x86
 directory
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
 boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org,
 rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com,
 conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
 alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com,
 ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com,
 wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230802164701.192791-1-guoren@kernel.org>
 <20230802164701.192791-19-guoren@kernel.org>
 <5cf1117c-d537-703c-cdcf-f43c5bd9ed1b@redhat.com>
 <CAJF2gTQ6zJrcyOVCqF+xDXTEzFYUVQuTP0rKy=K6R99TQ05CrA@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAJF2gTQ6zJrcyOVCqF+xDXTEzFYUVQuTP0rKy=K6R99TQ05CrA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_174802_965088_EAE073F2 
X-CRM114-Status: GOOD (  11.92  )
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

Ck9uIDgvMTEvMjMgMjA6MjQsIEd1byBSZW4gd3JvdGU6Cj4gT24gU2F0LCBBdWcgMTIsIDIwMjMg
YXQgNDo0MuKAr0FNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+IHdyb3RlOgo+PiBP
biA4LzIvMjMgMTI6NDcsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+Pj4gRnJvbTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4KPj4+IFRoZSBwdl9vcHMgYmVsb25ncyB0
byB4ODYgY3VzdG9tIGluZnJhc3RydWN0dXJlIGFuZCBjbGVhbnMgdXAgdGhlCj4+PiBjbmFfY29u
ZmlndXJlX3NwaW5fbG9ja19zbG93cGF0aCgpIHdpdGggc3RhbmRhcmQgY29kZS4gVGhpcyBpcwo+
Pj4gcHJlcGFyYXRpb24gZm9yIHJpc2N2IHN1cHBvcnQgQ05BIHFzcG9pbmxvY2suCj4+IENOQSBx
c3BpbmxvY2sgaGFzIG5vdCBiZWVuIG1lcmdlZCBpbnRvIG1haW5saW5lIHlldC4gSSB3aWxsIHN1
Z2dlc3QgeW91Cj4+IGRyb3AgdGhlIGxhc3QgMiBwYXRjaGVzIGZvciBub3cuIE9mIGNvdXJzZSwg
eW91IGNhbiBwcm92aWRlIGJlbmNobWFyawo+PiBkYXRhIHRvIGJvb3N0IHRoZSBjYXNlIGZvciB0
aGUgaW5jbHVzaW9uIG9mIHRoZSBDTkEgcXNwaW5sb2NrIHBhdGNoIGludG8KPj4gdGhlIG1haW5s
aW5lLgo+IFllcywgbXkgbGF6eSwgSSB3b3VsZCBzZXBhcmF0ZSBwYXJhdmlydCBhbmQgQ05BIGZy
b20gdGhpcyBzZXJpZXMuCgpwYXJhdmlydCBpcyBPSywgaXQgaXMganVzdCB0aGF0IENOQSBoYXNu
J3QgYmVlbiBtZXJnZWQgeWV0LgoKQ2hlZXJzLApMb25nbWFuCgo+Cj4+IENoZWVycywKPj4gTG9u
Z21hbgo+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
