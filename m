Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E760CCD192
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 13:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccIbBMdO1KhC7bqqAH5ntABIcq3pCvhNh1+GbXvML6M=; b=HM/PmtWg0MhhwP
	gaOamzUI0DuVvYfa/Ha77YmbQS+9IY0sCrO88PMmI3V8k5brZk4j8FPJAvI7Kj2W71voyjzUupu/j
	sL+YI+t8BOTaw3GZEelga9+RtfJZzMwMP7zXyJWhYSHp4HK1HCMelffxI+zfnZTg5iASJiH0m0DQE
	wY8iL6zoeNk+Tg1d7WY2Nfvmd/tO30Z0RX0OSmqmVIiuUdOxMGZgWlZ0p06/fXAeXX7F1GAnTiVJv
	rid3CMKycgy9R4DlL1BGsyrcoSVz0TWF4hmRtybvJs50n6EFNQpCLaOcD24ckKEwy31eBwYlFwljT
	CG5nIDcPdn/5FwSyU1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Mh-00000001gTB-3Fh2;
	Wed, 15 Oct 2025 13:16:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Me-00000001gRJ-19GF
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 13:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760534181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yD6dvIl7J8wWJkas/YONpCBWDBu3WvjIWx4zsxh951U=;
	b=P1tYJ83609pOBgeSTOaTE97f8Wk758C9IAb31UCbzwRXXIZRNeZhrIvaQxN7iYyX+R4SsF
	T+xkSvFUq0tGPbj4oD9vFLndWvNgph5l06LicKonAH31MhNfBSJp87dlb+NynoXewV7C5n
	1lC2UmVR9TtjsRiRqqiRAE0/bHoih0U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-GvSXeA63MM-TM7zDBtvMcg-1; Wed, 15 Oct 2025 09:16:18 -0400
X-MC-Unique: GvSXeA63MM-TM7zDBtvMcg-1
X-Mimecast-MFC-AGG-ID: GvSXeA63MM-TM7zDBtvMcg_1760534177
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ecdfe971abso5361216f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 06:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534177; x=1761138977;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yD6dvIl7J8wWJkas/YONpCBWDBu3WvjIWx4zsxh951U=;
        b=GvwObOrcjiCmb/d6EIvE5lhfMw6Gw0gox/HvSHDZNahlnuDFeDpw+SOQu2NVLGSGhX
         YIE0QRxgp8F9jVcdV7rKUA0t9cgxm5M+3DroaamSfBbchf2OBPiV0G/Oi6o4uvD7MJNe
         cHOPRqMXvCXq6u3xaXp5Q+a9FwXTZ5cx00VzMm9Dta69W3VJAGdoKYCTVi2Iv4MwukSW
         JGRWRPIfrAT1fijB8HMd7scMORyjVhO0tHmnA4nDAps1YQ4PCB5L0iXHO9V3RxkoZ7Mw
         /cvhT7RWrXFPbfJMNtb4KYXQtuWPWGEm1GOniqfkWpLKd4WW4GSjpCXM/RhPVsK4C2Vf
         c5nw==
X-Forwarded-Encrypted: i=1; AJvYcCVEitos9JUSuKkW1PNfBtGgJcedPeeTxPnDZyLl4DhPN5bHU6j/9Us5CwkZZXIgnMXLoAC+/vuD7Uv6Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfM45iozGn9LDK0OzgxmbuyaAVI0YDilD5fQI75W8MSVJn/t6S
	FjDb3qdOateTD79prryikFP0uk4cwz5+kZt7DvEBvWIJgFJAJ4VPUFPJHe4/TIoLZdWkcjS4dUL
	Qxnet2jmvP2VYVk9t6Qgwi/TGwkPltl7PnSiJ1i/pAb+XUZ9VO3X55GlvmhqcYwJa35vdWw==
X-Gm-Gg: ASbGncveQkSgbGs4mkKVlfvUo0YbRZE2HZdPvngP8zUTNI9QiiIq0mp653gsMb3uXw/
	Axyh/utUWyNBcKUUht8vZufLvlwVoGek9ro6tO4GjPNemtiRD8qKRZPoULOLm1OH8Y7K2FvN+Sr
	qzSFzQuFm2KpTIVSGiTXRFTQAGulyZ65s9GxZiY4fe+0Yw5R/uyb5PVsNnH9Xsg6hDWE3dlBbtH
	C59JjVUu+XUEoXFe/+KWCdpFm35k72WzetWukqxyu/+eEf3pM8NDUHNM0R0RBYUD7ddMUF6FgRH
	anNMsSXhGuX9czfv+b+y5fVpfV0buTyQzkUiwfAPu+ET8S1y/G1B5WvOsl6Py0XmVf7tVPnjqzv
	xYyQl9t9nVPWsnBidjxcYp0qgxA==
X-Received: by 2002:a05:6000:248a:b0:3f2:dc6e:6a89 with SMTP id ffacd0b85a97d-4266e8e4c29mr18416318f8f.57.1760534177101;
        Wed, 15 Oct 2025 06:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcUjf8Yi428dP9FWOn2X364zzJqp12CDvIxSjruyz4UDGZF5I3K12BFelQ7PlgEZWXYUZIhg==
X-Received: by 2002:a05:6000:248a:b0:3f2:dc6e:6a89 with SMTP id ffacd0b85a97d-4266e8e4c29mr18416272f8f.57.1760534176503;
        Wed, 15 Oct 2025 06:16:16 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57ccb1sm28976327f8f.8.2025.10.15.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:16:15 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn
 <jannh@google.com>, Dan Carpenter <dan.carpenter@linaro.org>, Oleg
 Nesterov <oleg@redhat.com>, Clark
 Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Daniel Wagner <dwagner@suse.de>,
 Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
 <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Date: Wed, 15 Oct 2025 15:16:13 +0200
Message-ID: <xhsmhwm4wl2zm.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: loBRJ9FKHpET4t27Gc_9IplhGpRo0lYA1aikxqCcBPw_1760534177
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_061624_412164_0F4D54E0 
X-CRM114-Status: GOOD (  16.36  )
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

T24gMTQvMTAvMjUgMTc6MjYsIFZhbGVudGluIFNjaG5laWRlciB3cm90ZToKPiBPbiAxNC8xMC8y
NSAxNDo1OCwgSnVyaSBMZWxsaSB3cm90ZToKPj4+IE5vaXNlCj4+PiArKysrKwo+Pj4KPj4+IFhl
b24gRTUtMjY5OSBzeXN0ZW0gd2l0aCBTTVRvZmYsIE5PSFpfRlVMTCwgaXNvbGF0ZWQgQ1BVcy4K
Pj4+IFJIRUwxMCB1c2Vyc3BhY2UuCj4+Pgo+Pj4gV29ya2xvYWQgaXMgdXNpbmcgcnRldmFsIChr
ZXJuZWwgY29tcGlsYXRpb24gKyBoYWNrYmVuY2gpIG9uIGhvdXNla2VlcGluZyBDUFVzCj4+PiBh
bmQgYSBkdW1teSBzdGF5LWluLXVzZXJzcGFjZSBsb29wIG9uIHRoZSBpc29sYXRlZCBDUFVzLiBU
aGUgbWFpbiBpbnZvY2F0aW9uIGlzOgo+Pj4KPj4+ICQgdHJhY2UtY21kIHJlY29yZCAtZSAiaXBp
X3NlbmRfY3B1bWFzayIgLWYgImNwdW1hc2sgJiBDUFVTeyRJU09MX0NQVVN9IiBcCj4+PiAgICAg
ICAgICAgICAgICAgLWUgImlwaV9zZW5kX2NwdSIgICAgIC1mICJjcHUgJiBDUFVTeyRJU09MX0NQ
VVN9IiBcCj4+PiAgICAgICAgICAgICAgICAgcnRldmFsIC0tb25seWxvYWQgLS1sb2Fkcy1jcHVs
aXN0PSRIS19DUFVTIFwKPj4+ICAgICAgICAgICAgICAgICAtLWhhY2tiZW5jaC1ydW5sb3dtZW09
VHJ1ZSAtLWR1cmF0aW9uPSREVVJBVElPTgo+Pj4KPj4+IFRoaXMgb25seSByZWNvcmRzIElQSXMg
c2VudCB0byBpc29sYXRlZCBDUFVzLCBzbyBhbnkgZXZlbnQgdGhlcmUgaXMgaW50ZXJmZXJlbmNl
Cj4+PiAod2l0aCBhIGJpdCBvZiBmdXp6IGF0IHRoZSBzdGFydC9lbmQgb2YgdGhlIHdvcmtsb2Fk
IHdoZW4gc3Bhd25pbmcgdGhlCj4+PiBwcm9jZXNzZXMpLiBBbGwgdGVzdHMgd2VyZSBkb25lIHdp
dGggYSBkdXJhdGlvbiBvZiA2IGhvdXJzLgo+Pj4KPj4+IHY2LjE3Cj4+PiBvIH41NDAwIElQSXMg
cmVjZWl2ZWQsIHNvIGFib3V0IH4yMDAgaW50ZXJmZXJpbmcgSVBJIHBlciBpc29sYXRlZCBDUFUK
Pj4+IG8gQWJvdXQgb25lIGludGVyZmVyaW5nIElQSSBqdXN0IHNoeSBvZiBldmVyeSAyIG1pbnV0
ZXMKPj4+Cj4+PiB2Ni4xNyArIHBhdGNoZXMKPj4+IG8gWmlsY2ghCj4+Cj4+IE5pY2UuIDopCj4+
Cj4+IEFib3V0IHBlcmZvcm1hbmNlLCBjYW4gd2UgYXNzdW1lIGhvdXNla2VlcGluZyBDUFVzIGFy
ZSBub3QgYWZmZWN0ZWQgYnkKPj4gdGhlIGNoYW5nZSAodGhleSBkb24ndCBzZWVtIHRvIHVzZSB0
aGUgdHJpY2sgYW55d2F5KSBvciBkbyB3ZSB3YW50L25lZWQKPj4gdG8gY29sbGVjdCBzb21lIG51
bWJlcnMgb24gdGhlbSBhcyB3ZWxsIGp1c3QgaW4gY2FzZSAobWF5YmUgbW9yZQo+PiB0aHJvdWdo
cHV0IG9yaWVudGVkKT8KPj4KPgo+IFNvIGZvciB0aGUgdGV4dF9wb2tlIElQSSB5ZXMsIGJlY2F1
c2UgdGhpcyBpcyBhbGwgZG9uZSB0aHJvdWdoCj4gY29udGV4dF90cmFja2luZyB3aGljaCBkb2Vz
bid0IGltcGx5IGhvdXNla2VlcGluZyBDUFVzLgo+Cj4gRm9yIHRoZSBUTEIgZmx1c2ggZmFmZiB0
aGUgSEsgQ1BVcyBnZXQgdHdvIGV4dHJhIHdyaXRlcyBwZXIga2VybmVsIGVudHJ5Cj4gY3ljbGUg
KG9uZSBhdCBlbnRyeSBhbmQgb25lIGF0IGV4aXQsIGZvciB0aGF0IHN0dXBpZCBzaWduYWwpIHdo
aWNoIEkgZXhwZWN0Cj4gdG8gYmUgbm90aWNlYWJsZSBidXQgc21hbGwtaXNoLiBJIGNhbiBkZWZp
bml0ZWx5IGdvIGFuZCBtZWFzdXJlIHRoYXQuCj4KCk9uIHRoYXQgc2FtZSBYZW9uIEU1LTI2OTkg
c3lzdGVtIHdpdGggdGhlIHNhbWUgdHVuaW5nLCB0aGUgYXZlcmFnZSB0aW1lCnRha2VuIGZvciAz
MDBNIGdldHRpZCBzeXNjYWxscyBvbiBob3VzZWtlZXBpbmcgQ1BVcyBpcwogIHY2LjE3OiAgICAg
ICAgICA2OTguNjRucyDCsSAyLjM1bnMKICB2Ni4xNyArIHNlcmllczogNzAyLjYwbnMgwrEgMy40
M25zCgpTbyBub3RpY2VhYmxlICh+LjYlIHdvcnNlKSBidXQgbm90IGhvcnJpYmxlPwoKPj4gVGhh
bmtzLAo+PiBKdXJpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
