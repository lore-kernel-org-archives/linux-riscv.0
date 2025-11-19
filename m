Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C86CF34D9
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmn9SLWniAkJ8EfR2v6j2cgjOXhXIOWV5JHoclohwfE=; b=vecIF+RdR5hQd1
	iD+nByrtvheNGieCEmn0i+vLMsWhZa0WytGE2SM7Q8ZiC6B99wd9jB5uN2AJrD5xWqIE/X/xOmsJ6
	3rihES4hLIqDw62MpQfHr5PEUishCWa2D1G8WkiZMOLPPWlz8YAOpD/nhs0YmYT/A/OlukoeOrxua
	+lnnNGMJzF/nIhPTfz9Zvzfm+OvBI5WSBZCnDzx9TYl0Mj8GFwywhQ+hOc5tMIa/Sd3Z+BFNwZOa8
	eOWBipZJEp4MkeKvtwjWygqVWsOynljweBKYOYetBNu1oPEt/VvUAxa000ttU2EodwbBZEJy3a2dc
	zrkc8yTQTSMS+Y+NpVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkMj-00000003VrQ-2emx;
	Wed, 19 Nov 2025 15:45:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkMg-00000003Vpw-2xMk
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763567099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+2RMibk5qCZlj/6zmvcs/X6W3gfpL9YpQv70ggfokw=;
	b=AeYttVC174L81fsSZCyrXbteruGobwH11N4VmTsj1LnLTBvGEfqKc5QUQdnF/cAOHKnku7
	VVFSf0XD48X+Q28ADTsihAeuFxwsvXdZfoJ0Vto3wS4n/5OX6w13FGA8Bti+B5MYKsq34z
	NFPKA4k39ov/fgx73H/KqrRffdW7j6s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-t2oEgj73O5OZ1Zw3TbjOsw-1; Wed, 19 Nov 2025 10:44:57 -0500
X-MC-Unique: t2oEgj73O5OZ1Zw3TbjOsw-1
X-Mimecast-MFC-AGG-ID: t2oEgj73O5OZ1Zw3TbjOsw_1763567096
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4779c35a66bso28829765e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 07:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567096; x=1764171896;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kk13dNEBENY1o2hkoOmhPMN6DaHaKFtT0pxiR0fZhjU=;
        b=cOs/FRfccskOhoJcA9DrdLTjSPIxlYLA698t8h7JAqG8Akr+1RlAL9U4KuJRapnAvT
         RQ0pZQimwgigM4AtgDF1fplZ+674eRNotIsIqiVFHga1pewJEKoyCLsZMOBwsiAZRG4c
         flBNb5VCIs72W9jiuwm+RrbeAn461WrdwYSM2koNY7ei03WRAbDu+PQ5LLJA6zFlkFN6
         qMNSY5bnVPdjpSBU0NAHGG/X+aIGesppmSdTzcYmJzOPLbFWDOOrw8Xngm4gzFYbD3d5
         gxcNWdx7ex4RPIKV3LfyiWuqmj7P4jmJ4gqG6STXIY+ueJMF24sG7rW7CWRXAzCnVQt6
         7CyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZMymsW2Q7kJugwCHfy1G3JKMcSAgdz9GqqlsCRAaLzErcox1UKv8Bg+cGVSRPuY47L9aOISZAvqM6ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvuCa6+Igy2E+IwpbxcawwChiUFnDI6qnLsd8lkT74vApaEE9O
	OcvUl0Fn2HlRtFVmJMwQqfecrgrwYIZuD/iKMBhbrWWy/I0MwEyzL4FhrVtusqcxvAYtrObVzQz
	YaTQFc28kWaSCQwXeEO0OVKQuHDu8hjA+h6nKQNveCsuBqir/p/lVBCuBoLxk5D9VMn3jtQ==
X-Gm-Gg: ASbGnct1fl8CVMJw9geNp13zdtY2F5Cie5aYt/NjuKPKPvPsr2kJcDjSvQrtvrgn498
	rwqU4pdwuWdGGgl9I/iP/hx4iHi6C30VTBZL3c71GBFnfenAYKX84qShb/B6Tshfp9Sr2LNGMAr
	4GyVid8KYb8Ck3nZ37QrG85WBFMattNqO6u+2jB1F24pI9VvnWKTkomvireIOplE7WNsBNBpTrw
	ICd89IkoD2PGnmsT3DeGb/xzlwvOfuHRHH5I0i6CYNeQvolC1nKAvE3OZ39KtvSncn1kflb+4tU
	6cOsfRjdwOABtHwSZzfFeVRFmKgxSw7/lLaLpLLpWE/Y0XXj3K4n3FG6hdQMPxCW3H6kYgVtcHy
	4H6Kh45JbJc3z+nYN6LExeFcbH6yom5BlEzyacNwFBL02DvVfDYMx+bPLlEYexxuSIjGIoJ4=
X-Received: by 2002:a05:600c:1d0e:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-4779cc37a15mr119020615e9.20.1763567096222;
        Wed, 19 Nov 2025 07:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkP+NxoN8NdgRlSeWXCmLJ99Tn2hRpBffdqlJtKvc6mMNR3Hn0LkbgzbfrqY0lLueiMZLQiA==
X-Received: by 2002:a05:600c:1d0e:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-4779cc37a15mr119020335e9.20.1763567095710;
        Wed, 19 Nov 2025 07:44:55 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10260adsm53340155e9.7.2025.11.19.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:44:54 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Andy Lutomirski <luto@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, rcu@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, "David S. Miller"
 <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman
 <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH v7 29/31] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
In-Reply-To: <65ae9404-5d7d-42a3-969e-7e2ceb56c433@app.fastmail.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-9-vschneid@redhat.com>
 <65ae9404-5d7d-42a3-969e-7e2ceb56c433@app.fastmail.com>
Date: Wed, 19 Nov 2025 16:44:53 +0100
Message-ID: <xhsmhecpukowa.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I8GaoRGvMIvu-qwgZIdglzC-JVwy9N28WgNEQbxIaEY_1763567096
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074502_810118_620934E9 
X-CRM114-Status: GOOD (  21.97  )
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

T24gMTkvMTEvMjUgMDY6MzEsIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPiBPbiBGcmksIE5vdiAx
NCwgMjAyNSwgYXQgNzoxNCBBTSwgVmFsZW50aW4gU2NobmVpZGVyIHdyb3RlOgo+PiBEZWZlcnJp
bmcga2VybmVsIHJhbmdlIFRMQiBmbHVzaGVzIHJlcXVpcmVzIHRoZSBndWFyYW50ZWUgdGhhdCB1
cG9uCj4+IGVudGVyaW5nIHRoZSBrZXJuZWwsIG5vIHN0YWxlIGVudHJ5IG1heSBiZSBhY2Nlc3Nl
ZC4gVGhlIHNpbXBsZXN0IHdheSB0bwo+PiBwcm92aWRlIHN1Y2ggYSBndWFyYW50ZWUgaXMgdG8g
aXNzdWUgYW4gdW5jb25kaXRpb25hbCBmbHVzaCB1cG9uIHN3aXRjaGluZwo+PiB0byB0aGUga2Vy
bmVsIENSMywgYXMgdGhpcyBpcyB0aGUgcGl2b3RpbmcgcG9pbnQgd2hlcmUgc3VjaCBzdGFsZSBl
bnRyaWVzCj4+IG1heSBiZSBhY2Nlc3NlZC4KPj4KPgo+IERvaW5nIHRoaXMgdG9nZXRoZXIgd2l0
aCB0aGUgUFRJIENSMyBzd2l0Y2ggaGFzIG5vIGFjdHVhbCBiZW5lZml0OiBNT1YgQ1IzIGRvZXNu
4oCZdCBmbHVzaCBnbG9iYWwgcGFnZXMuIEFuZCBkb2luZyB0aGlzIGluIGFzbSBpcyBwcmV0dHkg
Z3Jvc3MuICBXZSBkb27igJl0IGV2ZW4gZ2V0IGEgZnJlZSBzeW5jX2NvcmUoKSBvdXQgb2YgaXQg
YmVjYXVzZSBJTlZQQ0lEIGlzIG5vdCBkb2N1bWVudGVkIGFzIGJlaW5nIHNlcmlhbGl6aW5nLgo+
Cj4gV2h5IGNhbuKAmXQgd2UgZG8gaXQgaW4gQz8gIFdoYXTigJlzIHRoZSBhY3R1YWwgcmlzaz8g
IEluIG9yZGVyIHRvIHRyaXAgb3ZlciBhIHN0YWxlIFRMQiBlbnRyeSwgd2Ugd291bGQgbmVlZCB0
byBkZWZlcmVuY2UgYSBwb2ludGVyIHRvIG5ld2x5IGFsbG9jYXRlZCBrZXJuZWwgdmlydHVhbCBt
ZW1vcnkgdGhhdCB3YXMgbm90IHZhbGlkIHByaW9yIHRvIG91ciBlbnRyeSBpbnRvIHVzZXIgbW9k
ZS4gSSBjYW4gaW1hZ2luZSBCUEYgZG9pbmcgdGhpcywgYnV0IHBsYWluIG5vaW5zdHIgQyBpbiB0
aGUgZW50cnkgcGF0aD8gIEVzcGVjaWFsbHkgbm9pbnN0ciBDICp0aGF0IGhhcyBSQ1UgZGlzYWJs
ZWQqPyAgV2UgYWxyZWFkeSBjYW7igJl0IGZvbGxvdyBhbiBSQ1UgcG9pbnRlciwgYW5kIElTVE0g
dGhlIG9ubHkgc3R5bGUgb2Yga2VybmVsIGNvZGUgdGhhdCBtaWdodCBkbyB0aGlzIHdvdWxkIHVz
ZSBSQ1UgdG8gcHJvdGVjdCB0aGUgcG9pbnRlciwgYW5kIHdlIGFyZSBhbHJlYWR5IGRvb21lZCBp
ZiB3ZSBmb2xsb3cgYW4gUkNVIHBvaW50ZXIgdG8gYW55IHNvcnQgb2YgbWVtb3J5Lgo+CgpTbyB2
NCBhbmQgZWFybGllciBoYWQgdGhlIFRMQiBmbHVzaCBmYWZmIGRvbmUgaW4gQyBpbiB0aGUgY29u
dGV4dF90cmFja2luZyBlbnRyeQpqdXN0IGxpa2Ugc3luY19jb3JlKCkuCgpNeSBiaWdnZXN0IGlz
c3VlIHdpdGggaXQgd2FzIHRoYXQgSSBjb3VsZG4ndCBmaWd1cmUgb3V0IGEgd2F5IHRvIGluc3Ry
dW1lbnQKbWVtb3J5IGFjY2Vzc2VzIHN1Y2ggdGhhdCBJIHdvdWxkIGdldCBhbiBpZGVhIG9mIHdo
ZXJlIHZtYWxsb2MnZCBhY2Nlc3NlcwpoYXBwZW4gLSBldmVuIHdpdGggYSBoYWNraXNoIHRoaW5n
IGp1c3QgdG8gc3VydmV5IHRoZSBsYW5kc2NhcGUuIFNvIHdoaWxlIEkKYWdyZWUgd2l0aCB5b3Vy
IHJlYXNvbmluZyB3cnQgZW50cnkgbm9pbnN0ciBjb2RlLCBJIGRvbid0IGhhdmUgYW55IHdheSB0
bwpwcm92ZSBpdC4KVGhhdCdzIHVubGlrZSB0aGUgdGV4dF9wb2tlIHN5bmNfY29yZSgpIGRlZmVy
cmFsIGZvciB3aGljaCBJIGhhdmUgYWxsIG9mCnRoYXQgbmljZSBvYmp0b29sIGluc3RydW1lbnRh
dGlvbi4KCkRhdmUgYWxzbyBwb2ludGVkIG91dCB0aGF0IHRoZSB3aG9sZSBzdGFsZSBlbnRyeSBm
bHVzaCBkZWZlcnJhbCBpcyBhIHJpc2t5Cm1vdmUsIGFuZCB0aGF0IHRoZSBzYW5lc3QgdGhpbmcg
d291bGQgYmUgdG8gZXhlY3V0ZSB0aGUgZGVmZXJyZWQgZmx1c2gganVzdAphZnRlciBzd2l0Y2hp
bmcgdG8gdGhlIGtlcm5lbCBDUjMuCgpTZWUgdGhlIHRocmVhZCBzdXJyb3VuZGluZzoKICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMTE0MTc1MTQzLjgxNDM4LTMwLXZzY2huZWlk
QHJlZGhhdC5jb20vCgptYWlubHkgRGF2ZSdzIHJlcGx5IGFuZCBzdWJ0aHJlYWQ6CiAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8zNTIzMTdlMy1jN2RjLTQzYjQtYjRjYi05NjQ0NDg5MzE4
ZDBAaW50ZWwuY29tLwoKPiBXZSBkbyBuZWVkIHRvIHdhdGNoIG91dCBmb3IgTk1JL01DRSBoaXR0
aW5nIGJlZm9yZSB3ZSBmbHVzaC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
