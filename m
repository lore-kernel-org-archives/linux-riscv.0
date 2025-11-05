Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0223CCCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgz1OJncQmRLkhD8edPds0SK5vvMpUuzBuWqno31v3I=; b=P6OQw7w+0QKnyA
	mF/EoH0nbTVHG6vrm8f9rbugUl3f/ocjhEsfqo2m+L/FW/eqRX3Q3tZgF4GIyqEUjx6hACzb/YMZf
	3aMg5n94ScEWpSAZsQLkLXoocmf4ZTzwEFU5UpMM0hxFtUS+8gGg/4noiHvPDVJpaS3Bp7v4fFKx2
	S9l2L+hMGnQ9anm5Oj/AQKYfqLEZj1FHR/Q8Mftd8mvdYOZtNGKjOGUHTCV87F87+TFM4n9OOfjjL
	KzPouhLzXlcG5yDrXsHjWN/XP4FOvKV8LYz2CwzReXk4MamQncInH9XFdRMkrdq0kbvrFruu7TrIk
	xHdjcveRtLZrMjkjkUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgJO-0000000E3tf-1cf1;
	Wed, 05 Nov 2025 16:24:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgJK-0000000E3rv-32sh
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 16:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762359876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pRDkw3OiFwhnb76GBtLAGbxTsylSIgAC6rXytdCdKE=;
	b=Mjodf7t2o7jJO1Ys2SsyIEOq7w47WEVUh7jtSZNCQ/cypa66PSHMh174T9rj9XiUoz+4Hf
	jKi7xTxZchaKvhWJmDcWZvdd/Mymt3yFLjCDOJSzMGeYW9dVzfPeUcNTCEebIyCHdkZraG
	4I6xJo3MTyT8Js+ogH/nyx9gb2CtI7w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-xK482d9yO6SucVXZj-UmEg-1; Wed, 05 Nov 2025 11:24:34 -0500
X-MC-Unique: xK482d9yO6SucVXZj-UmEg-1
X-Mimecast-MFC-AGG-ID: xK482d9yO6SucVXZj-UmEg_1762359873
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47761eafd18so260145e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 08:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359873; x=1762964673;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPk6YcBuruLXQ/o+Uci3gsoXIOQlnGdWukNwLQbwsoc=;
        b=IYOU/kc9QV7k8QcDIE0Nc/ABxbGi8Wq8oliJstSjCkKcRixJaNu9AbPP1ATw5SJ+py
         /5EBQ6xRTvbpQQWrzJpEeWRKl1Zrn8sjsFzj994288X05RciYKnmO3RR5T9HgHL586CS
         KjxupUW/KlQ4/USdRB7Z52ucg2TkDxFUUx6kwX97sIzKLbhh9YLBOdSC7g8yvEbgp+73
         Ia9BNPuTrKiKJSncKUMWcOJfCiNbrYDRrzT/hi5SbY3xy14J669uOH7R+1CdZy6sUMXw
         Zu6iwLTZPlqxMyOzRsggtIMIy7RfjZyLXazWn3uMcKk+xfBpnY/Vk0XVefBCue1V5WiI
         nv/A==
X-Forwarded-Encrypted: i=1; AJvYcCXghZZPgKbrn05LggQdJD03xZkM+YePfl2N8LARAtRMjtDl/dOVe+4R1Gr1OtAxy1h6k6NvMKMbOaRGAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu13hWgTe0h2GPwMzXaTnRoou1QOWmE6sP2s34UjBzL5rOWM/k
	pdp3IO9z/ufrbVa5G1KT6fxtGZY2Dr6svHRQEAWnLDUe/Gkh/DsIKFjg9u9/J1Pkl1r8xOtLV2Q
	na65qYBafxokjq6mCUG1xm5mLeAG8VCf4UlvOOXkN7luZiQpHLqZtmof+4KQKSS7K76JHzQ==
X-Gm-Gg: ASbGncu5uqOia9lE2s7scLsJ6gZXkFAViAMqN64vrREJWp2tKopp39GKz2DeYHOMpAP
	pPrMK75VmGXvLkybhOsZQsqneH/pfbnMA63KmqdYA/1D8AJJgnwQ2kajI//mtxmbNyDfLIw25+d
	R6hdZ02+6+NhTtYRytzby/y0S/CmDS+xL4epT0BUP0yBLm8THgj12NpsTm9d8yNJkHQdbi4dld1
	3Ybs52EDs/EdMtPijJ8Ho1YRm150KwSI5aaSv3aFKbKsfEVq4Vgqp3Exrgb9MzOJl5sGSia//00
	jgeFCTy4TFKTuYEcdLkCh4a7kDnfWOBZD7ZKx8l0aBROSO1SLwjGE8ixoNOob5OyjA0ZQRwYF4L
	KHCaQn8cTC+RtMOltVcSRyXIfzzjadvPrKtZM6SaaGBjBkl28SLZ74x0HIKFU
X-Received: by 2002:a05:6000:2907:b0:429:d4c2:cadb with SMTP id ffacd0b85a97d-429e3311ac6mr3563204f8f.58.1762359873181;
        Wed, 05 Nov 2025 08:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL75fsQ0H2l1YahgWByyszuFW6670iMBa0il80FwPsU0pgmLcV2khMdpXTiSamLH801kgv9g==
X-Received: by 2002:a05:6000:2907:b0:429:d4c2:cadb with SMTP id ffacd0b85a97d-429e3311ac6mr3563132f8f.58.1762359872637;
        Wed, 05 Nov 2025 08:24:32 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fd2a7sm11003113f8f.39.2025.11.05.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:24:31 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aQJLpSYz3jdazzdb@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
 <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQJLpSYz3jdazzdb@localhost.localdomain>
Date: Wed, 05 Nov 2025 17:24:29 +0100
Message-ID: <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QFovCxgZiYuSE7VrAhNqnOJLFXGiLTnRbw_o6YbIqsI_1762359873
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_082438_836853_E9D31AD0 
X-CRM114-Status: GOOD (  17.78  )
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

T24gMjkvMTAvMjUgMTg6MTUsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgV2VkLCBP
Y3QgMjksIDIwMjUgYXQgMTE6MzI6NThBTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4gSSBuZWVkIHRvIGhhdmUgYSB0aGluayBhYm91dCB0aGF0IG9uZTsgb25lIHBhaW4g
cG9pbnQgSSBzZWUgaXMgdGhlIGNvbnRleHQKPj4gdHJhY2tpbmcgd29yayBoYXMgdG8gYmUgTk1J
IHNhZmUgc2luY2UgZS5nLiBhbiBOTUkgY2FuIHRha2UgdXMgb3V0IG9mCj4+IHVzZXJzcGFjZS4g
QW5vdGhlciBpcyB0aGF0IE5PSFotZnVsbCBDUFVzIG5lZWQgdG8gYmUgc3BlY2lhbCBjYXNlZCBp
biB0aGUKPj4gc3RvcCBtYWNoaW5lIHF1ZXVlaW5nIC8gY29tcGxldGlvbi4KPj4KPj4gL21lIGdv
ZXMgZmV0Y2ggYSBuZXcgbm90ZWJvb2sKPgo+IFNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyAodW50
ZXN0ZWQpID8KPgoKU29tZSBtaW5vciBuaXRzIGJlbG93IGJ1dCBvdGhlcndpc2UgdGhhdCBsb29r
cyBwcm9taXNpbmcuCgpPbmUgcHJvYmxlbSBJJ20gaGF2aW5nIGhvd2V2ZXIgaXMgcmVhc29uaW5n
IGFib3V0IHRoZSBkYW5nZXIgem9uZTsgd2hhdApmb3JiaWRkZW4gYWN0aW9ucyBjb3VsZCBhIE5P
X0haX0ZVTEwgQ1BVIHRha2Ugd2hlbiBlbnRlcmluZyB0aGUga2VybmVsCndoaWxlIHRha2VfY3B1
X2Rvd24oKSBpcyBoYXBwZW5pbmc/CgpJJ20gYWN0dWFsbHkgbm90IGZhbWlsaWFyIHdpdGggd2h5
IHdlIGFjdHVhbGx5IHVzZSBzdG9wX21hY2hpbmUoKSBmb3IgQ1BVCmhvdHBsdWc7IEkgc2VlIHRo
aW5ncyBsaWtlIENQVUhQX0FQX1NNUENGRF9EWUlORzo6c21wY2ZkX2R5aW5nX2NwdSgpIG9yCkNQ
VUhQX0FQX1RJQ0tfRFlJTkc6OnRpY2tfY3B1X2R5aW5nKCkgZXhwZWN0IG90aGVyIENQVXMgdG8g
YmUgcGF0aWVudGx5CnNwaW5uaW5nIGluIG11bHRpX2NwdV9zdG9wKCksIGFuZCBJICp0aGluayog
bm90aGluZyBpbiB0aGUgZW50cnkgY29kZSB1cCB0bwpjb250ZXh0X3RyYWNraW5nIGVudHJ5IHdv
dWxkIGRpc3J1cHQgdGhhdCwgYnV0IGl0J3Mgbm90IGEgc21hbGwgdGhpbmcgdG8KcmVhc29uIGFi
b3V0LgoKQUZBSUNUIHdlIG5lZWQgdG8gcmVhc29uIGFib3V0IGV2ZXJ5IC50ZWFyZG93biBjYWxs
YmFjayBmcm9tCkNQVUhQX1RFQVJET1dOX0NQVSB0byBDUFVIUF9BUF9PRkZMSU5FIGFuZCB0aGVp
ciBleHBsaWNpdCAmIGltcGxpY2l0CmRlcGVuZGVuY2llcyBvbiBvdGhlciBDUFVzIGJlaW5nIFNU
T1AnZC4KCj4gQEAgLTE3Niw2ICsxNzcsNjggQEAgc3RydWN0IG11bHRpX3N0b3BfZGF0YSB7Cj4g
ICAgICAgYXRvbWljX3QJCXRocmVhZF9hY2s7Cj4gIH07Cj4KPiArc3RhdGljIERFRklORV9QRVJf
Q1BVKGludCwgc3RvcF9tYWNoaW5lX3BvbGwpOwo+ICsKPiArdm9pZCBzdG9wX21hY2hpbmVfcG9s
bF93YWl0KHZvaWQpCgpUaGF0IG5lZWRzIHRvIGJlIG5vaW5zdHIsIGFuZCBBRkFJQ1QgdGhlcmUn
cyBubyBwcm9ibGVtIHdpdGggZG9pbmcganVzdCB0aGF0LgoKPiArewo+ICsJaW50ICpwb2xsID0g
dGhpc19jcHVfcHRyKCZzdG9wX21hY2hpbmVfcG9sbCk7Cj4gKwo+ICsJd2hpbGUgKCpwb2xsKQo+
ICsJCWNwdV9yZWxheCgpOwo+ICsJLyogRW5mb3JjZSB0aGUgd29yayBpbiBzdG9wIG1hY2hpbmUg
dG8gYmUgdmlzaWJsZSAqLwo+ICsJc21wX21iKCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHN0
b3BfbWFjaGluZV9wb2xsX3N0YXJ0KHN0cnVjdCBtdWx0aV9zdG9wX2RhdGEgKm1zZGF0YSkKPiAr
ewo+ICsJaW50IGNwdTsKPiArCj4gKwlpZiAoaG91c2VrZWVwaW5nX2VuYWJsZWQoSEtfVFlQRV9L
RVJORUxfTk9JU0UpKQoKSSB0aGluayB0aGF0IHdhbnRzIGEgbmVnYXRpb24KCj4gKwkJcmV0dXJu
Owo+ICsKPiArCS8qIFJhbmRvbSB0YXJnZXQgY2FuJ3QgYmUga25vd24gaW4gYWR2YW5jZSAqLwo+
ICsJaWYgKCFtc2RhdGEtPmFjdGl2ZV9jcHVzKQo+ICsJCXJldHVybjsKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
