Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A2DC3ABA9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQoNFMmtIrEuxewQd8Jx5Uiy3gsY1DoPKiut3Sg0PoY=; b=T7MGn1gFERaQoJ
	PMxrT0cvl2E3/U+VL4V2zNQd3dTGY/f5upHVPrt9RT1+RUdt8qJH7YqVqK0m9oCwYaFsVU1ObliQi
	7k/hnJGfiRxPMNa/DKbdEBo6mxYNlC44FaFGSWxHB7HWfT+CpQDOhWAHUol+UYMd9WDoWU5PPP6ab
	LLWyApZY9zEdoXRHh3GFK9CnKY6b0c/soBtnU0Hk1cjZuKrPPATABzcy+tb+BVUaS6bOvHsLAubUg
	dkWak43XmjvhQvlEyn6lgzd0r51hZT8aDrFJxsfsQTrzlkNitLONWy8vZGz3IuNMfy43APXIxzDwh
	IPS9Yksz5Uln6e1CQM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Pc-0000000CoUl-0YZK;
	Wed, 30 Apr 2025 12:19:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Nh-0000000Co5S-0arY
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 12:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746015460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lN3XXhvZkEzmXtYd28YKRe70tCct3jaUfGTuQGGD+g0=;
	b=MzsjMLRwFFaXsGd5V2hZU88e+9tzz1oYQZxf7pXyFuXHsIbFdHwE6KBdq+V544QAlzq4T9
	7SNKd26QSZAXFHVSrCT89/ykwaMl51Z35HBxv+D56/YicriLFR8RioUdUYffzGrWI5mMhk
	0PT2BdIdodD0av+ETBONBR1dMQSHPgQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-V89ByroaMhmLOCFYxCxoyA-1; Wed, 30 Apr 2025 08:17:35 -0400
X-MC-Unique: V89ByroaMhmLOCFYxCxoyA-1
X-Mimecast-MFC-AGG-ID: V89ByroaMhmLOCFYxCxoyA_1746015454
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso49277625e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 05:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015454; x=1746620254;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lN3XXhvZkEzmXtYd28YKRe70tCct3jaUfGTuQGGD+g0=;
        b=GSIz4OL2fnIFdIfENHhyH69S6kE7E5TTXu1W19wBZOzAamzJ/C4ilVHdprBqFw5eAV
         zyDYwxvmEpu8eiVWYXSUTTUJxmJoJKjBsZIcHVHgpc28fNgNdNbDkv13zUDEyMyLBrob
         2rrr4oTsuJNWNpwRPL9qlkJxZ+Dm4w/vX1EbMljrWjy2gHCM3KCiMoUvNoPe4b3gSOpq
         yV518cq8GL4OSqhnwIVlk0YQ+x0WCGtXJ5ZNPyjCDf2jQAJn6851cipkzO/0dOVmvVVV
         BhSchUuvSjJMnEEUAlPTw6nXzkc8kWN+P+O+FRpi3lM71arp5zDFbCYWGs6aihn5kF29
         1VVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk5tk++W7kc/bGC5Jk0eZVrdtAfjAlpGOdqvbwFbOm8Pv/Jm2P3GR6Bqlgv9EiRNaRlPAcZoJ3d3EjFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYPn5NRe1hLISNIBO+ECv+Av5eQot35sEuNMO3KyseE4dfkUOc
	rFOMVqoUndgD+SLYytLWrANw2oKBBjVvvRao/KwsLk6Nb8Dnn75MJe/tKgEK2KOdW9DJmBTuzSs
	MQpQVFtTohf3/uIHqA2oBYkpJasdF7PFVi2hen470AdYLRKhNgdb6MXjtvt+3NwLCfQ==
X-Gm-Gg: ASbGncvgvDt+NDAWz2N3HVMaXSFBYBacuU2TpVzvCYsB/4O/5ZKKWvI5d4g4Cnmd5Qj
	hclMSfgfcg8UBi/yXADe+uw9S75p1v5ywEtkExe5UI+wzOxpMaCcruRl5T64LW+ayDdJKZ24bWr
	YbJZ5makWJRrXX8qLcJaGqR4SwQi2Pzhp/tfQ/R1hdFpfmfrKvoDzAQCb/zi/1iCwX0fcKfb+al
	xGEDN8K8+rvAGZjt/I091fuVBRbaBuXl35WWM40U2FKV8OjDvbTuM9mcGEgan2kYWD3xFe2WMV0
	nzeRZVa2EnIlYQc2ARLeVvpXctCmhP7+9bgNCQ==
X-Received: by 2002:a05:600c:3b08:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-441b43a6849mr12659155e9.31.1746015454190;
        Wed, 30 Apr 2025 05:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeDRQpH85Tjf5lCeTC38YV5zFGOEEWEJ15Q43zpvFHsUBUREIV9t8rFVVspwP+av3krGaKQA==
X-Received: by 2002:a05:600c:3b08:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-441b43a6849mr12658865e9.31.1746015453815;
        Wed, 30 Apr 2025 05:17:33 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2a9dsm23611265e9.19.2025.04.30.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:17:33 -0700 (PDT)
Message-ID: <cbcefdb80d5e10b8fed80de17bb97bf61df81386.camel@redhat.com>
Subject: Re: [PATCH v6 00/22] RV: Linear temporal logic monitors for RT
 application
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, john.ogness@linutronix.de, Petr Mladek	
 <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo
 Molnar	 <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav
 Petkov	 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin"	 <hpa@zytor.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra	 <peterz@infradead.org>, Catalin Marinas
 <catalin.marinas@arm.com>, 	linux-arm-kernel@lists.infradead.org, Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 30 Apr 2025 14:17:30 +0200
In-Reply-To: <cover.1745999587.git.namcao@linutronix.de>
References: <cover.1745999587.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0SMqX1qO2HUIWH0zwGjBCsfrMBuVoTgw-c52fIOFdI8_1746015454
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_051741_249259_CF8C4E41 
X-CRM114-Status: GOOD (  34.20  )
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

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDEzOjAyICswMjAwLCBOYW0gQ2FvIHdyb3RlOgo+IFJlYWwt
dGltZSBhcHBsaWNhdGlvbnMgbWF5IGhhdmUgZGVzaWduIGZsYXdzIGNhdXNpbmcgdGhlbSB0byBo
YXZlCj4gdW5leHBlY3RlZCBsYXRlbmN5LiBGb3IgZXhhbXBsZSwgdGhlIGFwcGxpY2F0aW9ucyBt
YXkgcmFpc2UgcGFnZQo+IGZhdWx0cywgb3IKPiBtYXkgYmUgYmxvY2tlZCB0cnlpbmcgdG8gdGFr
ZSBhIG11dGV4IHdpdGhvdXQgcHJpb3JpdHkgaW5oZXJpdGFuY2UuCj4gCj4gSG93ZXZlciwgd2hp
bGUgYXR0ZW1wdGluZyB0byBpbXBsZW1lbnQgREEgbW9uaXRvcnMgZm9yIHRoZXNlIHJlYWwtCj4g
dGltZQo+IHJ1bGVzLCBkZXRlcm1pbmlzdGljIGF1dG9tYXRvbiBpcyBmb3VuZCB0byBiZSBpbmFw
cHJvcHJpYXRlIGFzIHRoZQo+IHNwZWNpZmljYXRpb24gbGFuZ3VhZ2UuIFRoZSBhdXRvbWF0b24g
aXMgY29tcGxpY2F0ZWQsIGhhcmQgdG8KPiB1bmRlcnN0YW5kLAo+IGFuZCBlcnJvci1wcm9uZS4K
PiAKPiBGb3IgdGhlc2UgY2FzZXMsIGxpbmVhciB0ZW1wb3JhbCBsb2dpYyBpcyBmb3VuZCB0byBi
ZSBtb3JlIHN1aXRhYmxlLgo+IFRoZQo+IExUTCBpcyBtb3JlIGNvbmNpc2UgYW5kIGludHVpdGl2
ZS4KPiAKPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIExUTCBSViBtb25pdG9yLCBhbmQg
dXNlIGl0IHRvIGltcGxlbWVudAo+IHR3bwo+IG1vbml0b3JzIGZvciByZXBvcnRpbmcgcHJvYmxl
bXMgd2l0aCByZWFsLXRpbWUgdGFza3MuCj4gCgpTdGV2ZSwKCkZyb20gbXkgcG9pbnQgb2Ygdmll
dyB0aGlzIHNlcmllcyBpcyByZWFkeSBmb3IgaW5jbHVzaW9uLCB3aGF0IGRvIHlvdQp0aGluaz8K
CldlIG1heSBzdGlsbCBuZWVkIEFja3MgZnJvbSB0aGUgeDg2IGFuZCBhcm02NCBtYWludGFpbmVy
cyByZWdhcmRpbmcgdGhlCnRyYWNlcG9pbnRzIGNoYW5nZXMsIHRob3VnaC4KClRoYW5rcywKR2Fi
cmllbGUKCj4gUGF0Y2ggMS0xMiBjbGVhbnVwIGFuZCBwcmVwYXJlIHRoZSBSViBjb2RlIGZvciB0
aGUgaW50ZWdyYXRpb24gb2YgTFRMCj4gbW9uaXRvcnMuCj4gCj4gUGF0Y2ggMTMgYWRkcyBzdXBw
b3J0IGZvciBMVEwgbW9uaXRvcnMuCj4gCj4gUGF0Y2ggMTQgYWRkcyB0aGUgY29udGFpbmVyIG1v
bml0b3IgInJ0YXBwIi4gVGhpcyBlbmNhcHN1bGF0ZXMgdGhlCj4gc3ViLW1vbml0b3JzIGZvciBy
ZWFsLXRpbWUuCj4gCj4gUGF0Y2ggMTUtMTggcHJlcGFyZXMgdGhlIHBhZ2VmYXVsdCB0cmFjZXBv
aW50cywgc28gdGhhdCBwYXRjaCAxOSBjYW4KPiBhZGQKPiB0aGUgbW9uaXRvciB3aGljaCB3YXRj
aGVzIHJlYWwtdGltZSB0YXNrcyBkb2luZyBwYWdlIGZhdWx0cy4KPiAKPiBQYXRjaCAyMCBhZGRz
IHRoZSAic2xlZXAiIG1vbml0b3I6IGl0IGRldGVjdHMgcG90ZW50aWFsIHVuZGVzaXJhYmxlCj4g
bGF0ZW5jeQo+IHdpdGggcmVhbC10aW1lIHRocmVhZHMuCj4gCj4gUGF0Y2ggMjEgYWRkcyBkb2N1
bWVudGF0aW9uIG9uIHRoZSBuZXcgbW9uaXRvcnMuCj4gCj4gUGF0Y2ggMjIgYWxsb3dzIHRoZSBu
dW1iZXIgb2YgcGVyLXRhc2sgbW9uaXRvcnMgdG8gYmUgY29uZmlndXJhYmxlLAo+IHNvIHRoYXQK
PiB0aGUgdHdvIG5ldyBtb25pdG9ycyBjYW4gYmUgZW5hYmxlZCBzaW11bHRhbmVvdXNseS4KPiAK
PiB2NS0+djYKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2NvdmVyLjE3NDU5MjYzMzEu
Z2l0Lm5hbWNhb0BsaW51dHJvbml4LmRlCj4gwqAgLSBzbGVlcCBtb25pdG9yOiBEcm9wIHRoZSBi
bG9ja19vbl9ydF9tdXRleCB0cmFjZXBvaW50cy4gVGhlCj4gY29udGVudGlvbgo+IMKgwqDCoCB0
cmFjZXBvaW50cyBhcmUgc3VmZmljaWVudC4KPiAKPiB2NC0+djUKPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL2NvdmVyLjE3NDUzOTA4MjkuZ2l0Lm5hbWNhb0BsaW51dHJvbml4LmRlCj4g
wqAgLSBzbGVlcCBtb25pdG9yOiBGaXggYSBmYWxzZSBwb3NpdGl2ZSBkdWUgdG8gYSByYWNlIHdp
dGggd2FraW5nIGFuZAo+IMKgwqDCoCBzY2hlZHVsaW5nLgo+IMKgIC0gc2xlZXAgbW9uaXRvcjog
QWRkIGJsb2NrX29uX3J0X211dGV4IHRyYWNlcG9pbnRzIGFuZCB1c2UgdGhlbSBmb3IKPiDCoMKg
wqAgQkxPQ0tfT05fUlRfTVVURVgsIGluc3RlYWQgb2YgdHJhY2Vfc2NoZWRfcGlfc2V0cHJpbwo+
IMKgIC0gc2xlZXAgbW9uaXRvcjogdGlnaHRlbiB0aGUgcnVsZSBvbiBuYW5vc2xlZXA6IG9ubHkK
PiBjbG9ja19uYW5vc2xlZXAoKQo+IMKgwqDCoCB3aXRoIFRJTUVSX0FCU1RJTUUgYW5kIENMT0NL
X01PTk9UT05JQyBpcyBhbGxvd2VkCj4gwqAgLSBhZGQgY29tbWVudHMgZXhwbGFpbmluZyB3aHkg
aXQgaXMgY29ycmVjdCB0byB0cmVhdCBQSS1ib29zdGVkCj4gdGFza3MgYXMKPiDCoMKgwqAgcmVh
bC10aW1lIHRhc2tzLgo+IAo+IMKgwqDCoCBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBkdWUgdG8g
dGhlIGNoYW5nZXMgaW4gdjUsICdwZXJmJyBkb2VzIG5vdAo+IHdvcmsKPiDCoMKgwqAgYXMgd2Vs
bCBhcyBiZWZvcmUsIGJlY2F1c2Ugc29tZXRpbWVzIHRoZSBlcnJvcnMgaGFwcGVuIG91dCBvZiB0
aGUKPiDCoMKgwqAgcmVhbC10aW1lIHRhc2tzJyBjb250ZXh0cy4gRml4aW5nIHRoaXMgaXMgbGVm
dCBmb3IgZnV0dXJlIHdvcmsuCj4gCj4gwqDCoMKgIHN0cmVzcy1uZyBpcyBhbHNvIGZhciBub2lz
aWVyIGluIHY1LCBiZWNhdXNlIHRoZSBydWxlIG9uCj4gbmFub3NsZWVwIGlzCj4gwqDCoMKgIHRp
Z2h0ZW5lZC4KPiAKPiB2My0+djQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2NvdmVy
LjE3NDQ3ODUzMzUuZ2l0Lm5hbWNhb0BsaW51dHJvbml4LmRlCj4gwqAgLSBzdXBwb3J0IGRlYWRs
aW5lIHRhc2tzCj4gwqAgLSBydGFwcF9zbGVlcDogdXNlIHNjaGVkX3BpX3NldHByaW8gdHJhY2Vw
b2ludCBpbnN0ZWFkIG9mCj4gY29udGVudGlvbgo+IMKgwqDCoCB0cmFjZXBvaW50cyBmb3IgQkxP
Q0tfT05fUlRfTVVURVgsIHNvIHRoYXQgcHJveHkgbG9jayBpcyBjb3ZlcmVkLgo+IMKgIC0gZml4
IHRoZSBzY3JpcHRzIGdlbmVyYXRpbmcgYW4gInNsaWdodGx5IiBpbmNvcnJlY3QgdmVyaWZpY2F0
aW9uCj4gYXV0b21hdG9uCj4gwqAgLSBtYWtlcyBydGFwcCBtb25pdG9yIGRlcGVuZHMgb24gUlZf
UEVSX1RBU0tfTU9OSVRPUlMgPj0gMgo+IMKgIC0gbWFrZSB0aGUgZXZlbnQgdHJhY2Vwb2ludCBv
dXRwdXQgYSBiaXQgbW9yZSByZWFkYWJsZQo+IMKgIC0gc29tZSBkb2N1bWVudGF0aW9uJ3MgZm9y
bWF0IGZpeGVzCj4gCj4gdjItPnYzCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9jb3Zl
ci4xNzQ0MzU1MDE4LmdpdC5uYW1jYW9AbGludXRyb25peC5kZS8KPiDCoCAtIGZpeCBhIHByb2Js
ZW0gd2l0aCBzbGVlcCBtb25pdG9yJ3Mgc3BlY2lmaWNhdGlvbiAoYXJvdW5kCj4gwqDCoMKgIEtU
SFJFQURfU0hPVUxEX1NUT1ApCj4gwqAgLSBtZXJnZSB0aGUgcGF0Y2hlcyB0aGF0IG1vdmUgdGhl
IGRvdDJrL3J2Z2VuIHNjcmlwdHMgYXJvdW5kCj4gwqAgLSBwdWxsIHBhbmljL3ByaW50ayBjaGFu
Z2VzIGludG8gc2VwYXJhdGUgcGF0Y2hlcwo+IMKgIC0gZml4dXAgc29tZSBidWlsZCBlcnJvcnMK
PiDCoCAtIGZpeHVwIG1vbml0b3IncyBpbml0IGZ1bmN0aW9uIHJldHVybiBjb2RlCj4gwqAgLSBm
aXggc29tZSBmbGFrZTggd2FybmluZ3Mgd2l0aCB0aGUgc2NyaXB0cwo+IMKgIC0gYWRkIHNvbWUg
cmVmZXJlbmNlcyB0byBMVEwgZG9jdW1lbnRhdGlvbgo+IMKgIC0gZml4dXAgc29tZSBtaXN0YWtl
cyB3aXRoIHJ0YXBwIGRvY3VtZW50YXRpb24KPiDCoCAtIGZpeHVwIGNhcGl0YWxpemF0aW9uIG1p
c3Rha2Ugd2l0aCBtb25pdG9yX3N5bnRoZXNpcy5yc3QKPiDCoCAtIHJlbW92ZSB0aGUgbm93LXJl
ZHVuZGFudCBtYWNybyBSVl9QRVJfVEFTS19NT05JVE9SUwo+IAo+IHYxLT52Mgo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvY292ZXIuMTc0MTcwODIzOS5naXQubmFtY2FvQGxpbnV0cm9u
aXguZGUvCj4gwqAgLSBJbnRlZ3JhdGUgdGhlIExUTCBzY3JpcHRzIGludG8gdGhlIGV4aXN0aW5n
IGRvdDJrIHRvb2wsIHRha2luZwo+IMKgwqDCoCBhZHZhbnRhZ2Ugb2YgdGhlIGV4aXN0aW5nIG1v
bml0b3IgZ2VuZXJhdGlvbiBzY3JpcHRzLgo+IMKgIC0gU3dpdGNoIHRoZSBzdHJ1Y3QgbHRsX21v
bml0b3IgdG8gdXNlIGJpdG1hcCBpbnN0ZWFkIG9mIGFuIGFycmF5LAo+IHRvCj4gwqDCoMKgIG9w
dGltaXplIG1lbW9yeSB1c2FnZS4KPiDCoCAtIENvcnJlY3QgdGhlIGdlbmVyYXRlZCBjb2RlIHRv
IGJlIG5vbi1kZXRlcm1pbmlzdGljIHN0YXRlIG1hY2hpbmUsCj4gwqDCoMKgIGluc3RlYWQgb2Yg
ZGV0ZXJtaW5pc3RpYyBzdGF0ZSBtYWNoaW5lCj4gwqAgLSBQdXQgY29tbW9uIGNvZGUgZm9yIGFs
bCBMVEwgbW9uaXRvcnMgaW50byBhIHNpbmdsZSBmaWxlCj4gwqDCoMKgIChpbmNsdWRlL3J2L2x0
bF9tb25pdG9yLmgpLCByZWR1Y2luZyBjb2RlIGR1cGxpY2F0aW9uCj4gwqAgLSBDaGFuZ2UgdGhl
IExUTCBtb25pdG9ycyB0byBtYWtlIHVzZXIgb2YgY29udGFpbmVyLiBBZGQgYSBidWcgZml4Cj4g
dG8KPiDCoMKgwqAgY29udGFpbmVyIHdoaWxlIGF0IGl0Lgo+IMKgIC0gTWFrZSB0aGUgbnVtYmVy
IG9mIHBlci10YXNrIG1vbml0b3IgY29uZmlndXJhYmxlCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
