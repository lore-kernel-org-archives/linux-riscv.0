Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D01E7E0CA
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+/VbbQh/FPJJ1y3SXcxmTKGeUDgZoIgwC+4hLci0cI=; b=y7Tg6Q0trti+jk
	DYQIC5BUX6OjR4mmhO66OkY7UweJ1SDsaGwcjmCRqfYLI+wgCbahZHtQI1+gD0Ou0M4m/F8IGWDIm
	icZO3Do5E/eDhNK3fGOOwcW65rOs+Y5f2XEiAJnIGkEDjJOTjnNxkNi1HE0YqVMfn/mTyWTxkKFtw
	RKwgVDydDspcmgnTeUysAopZBUn81Pdmsf2y5sDE65s0pTa3TqaGG/HFBkK41C2X0NkH7pV1r8Osm
	80MYyk4HAhQXs9KROSEAfq6fIQEe0JNKOXnMQgh1pFS+wgepKOK6G2cGMqqP+dL9H8p/xLa0Kv+uv
	+VMyvMgPy5aK5JeXmEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPGB-0000000FHpD-44RD;
	Mon, 09 Feb 2026 11:16:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPG9-0000000FHol-0gge
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 11:16:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so3695827a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 03:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1770635809; x=1771240609; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/49ACv1y9BF8ELhF542Tvo6MFA/gJBFS6KhbGkF9Xo=;
        b=Oc8p3gc2UZZLgOvwG/RfwvYecT1opRPrNGxGgCFSInKBVWfNIm4RXjB8T81Zv8oLEp
         jeyiFuQlwLRSYvJnZxLEJ//h1Dji7PQAZtqJJGpBlHblExJC+f0qdyRdNdDta7u9Dcuw
         LYnjR0Kgj3hUGoO0Lp64ZHt6q0KTN0ITsxGUwXcZ5MaOTJ7YqUPl/3yyfAcvdg+3HgRm
         l10nytqXzbQ+ZLTmOtaYVvTvPtj3cB2orPe5+d+LZtw5ZoeRu+W7qQPvVEcHCcJ4XTa+
         11iUxf/q9KG0Q2IxLQwBApcnZq9d4tlClc4SXqPB2b/wfUBHideNC4YRT2XQ7UdkaCEd
         2EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770635809; x=1771240609;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/49ACv1y9BF8ELhF542Tvo6MFA/gJBFS6KhbGkF9Xo=;
        b=vx+K9FFT8KFklj2kNqWH4J6YknwSZn6xLOjSm4S39R/bP6e2hu23xpBvWKo43W/jdx
         Q5JJpcfqWvl+So4i32Tl40tdle2LuNfAC8BkHfoeib3D4AgnbV+mrykP5HQESNLiymjZ
         OGIDvXBHOZUFZilifDkGg0Xmptd/2Lbaa6eoqE2utxko7jE13em5KymB936jCGKiFGip
         BXDKC2Hbn+1Wtrxvirs5UOxHybgUOZ8z1MZtLUzXYdiJpN2+0R1oolJT5gHF7QM0w7Uk
         00F+cCQq8qhnUABRa6QGc3MwqKv59L5CH5t/SNZiF9xJF8zj1d7OBss07F6if4OoiNwy
         EE2A==
X-Forwarded-Encrypted: i=1; AJvYcCUSvizM303E17cOib2g2HxJ6oiMN5KLxLM+W4CvFkp8SIDffhigQEPNEu3W49XRUmp9D5KPdIHevqbAQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV1fgVj5wgjb5EBa4za8S7ZObY97shVQR8zW+IFfgJLjUeGh8Z
	duj4bA71m127EXGl0FA1sZIHG7zVD3lvAVh1K8Cx/N0mCL3ZrmeZKqiyfSRjiT9Yn2E=
X-Gm-Gg: AZuq6aLGVZGH7s0jUUwxcy/4hIMmfCd4/d/4DMRcBnBA3ScqQoPZeMNGugtNdXUItxc
	jriDoUxEWdmPhhvWRgzjlOwUHA/8+Q/i5cfOGwEfhVL5/q4neugepz1a/+xcRGCW7PqLWQw2onp
	jHseZ/Y4YlUg5TWYvrvtOX3KIaN/Kli0W4yUAADjAHIlxLvqjrUcfofxvdTUN5fhAvWt0KbXHj8
	iSmdmEBYHDjmrIR6ETWuyQ7RegKZ4ggWBqxBsJZkPNPXOS7aZoteonKwiFo0Vj2FUv/UUeWCPYM
	YKK261eEyL5S3Wcoi8UP6ncFrbOuca9fb69zVgUNXXT9H70WrQtDpMH9W7Uh05jFrnJNPTDGaJQ
	Hji9WLmXBgfuMwSCWQNBtTFMoIBEJjUzfLr1Z93h7urKYYmcic2t9LdNDsOeRsjm2cwZnaCzJ3I
	Kwag8hBw2BHANV4YXWvaYLzzc71OG/59fxz692C20eoZ6icBAK+Is=
X-Received: by 2002:a17:90b:4f45:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-354b3cd5f41mr9185689a91.26.1770635808737;
        Mon, 09 Feb 2026 03:16:48 -0800 (PST)
Received: from smtpclient.apple ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c38fa4fsm15661019a91.13.2026.02.09.03.16.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:16:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [External] [PATCH] drivers/perf: riscv: Keep the fixed counter
 counting
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <fd316311-91cb-4a95-bc56-4f2b6c8fb87c@linux.dev>
Date: Mon, 9 Feb 2026 19:16:32 +0800
Cc: cp0613@linux.alibaba.com,
 anup@brainfault.org,
 alex@ghiti.fr,
 pjw@kernel.org,
 guoren@kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <D81C1384-C09C-4913-82B5-158BAB5FD51B@bytedance.com>
References: <20260131112440.2915-1-cp0613@linux.alibaba.com>
 <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
 <0E982A8E-9CD2-4712-AC59-56D7CA043A2A@bytedance.com>
 <fd316311-91cb-4a95-bc56-4f2b6c8fb87c@linux.dev>
To: Atish Patra <atish.patra@linux.dev>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_031653_257055_D2FFC33F 
X-CRM114-Status: GOOD (  25.48  )
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

Cj4gT24gRmViIDgsIDIwMjYsIGF0IDE3OjMyLCBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAbGlu
dXguZGV2PiB3cm90ZToKPiAKPiAKPiBPbiAyLzQvMjYgNToxMyBBTSwgcWluZ3dlaSBodSB3cm90
ZToKPj4+IE9uIEZlYiA0LCAyMDI2LCBhdCAxNzoxNywgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4+PiAKPj4+IAo+Pj4gT24gMS8zMS8yNiAzOjI0IEFNLCBjcDA2
MTNAbGludXguYWxpYmFiYS5jb20gd3JvdGU6Cj4+Pj4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0Bs
aW51eC5hbGliYWJhLmNvbT4KPj4+PiAKPj4+PiBUaGUgUklTQy1WIFNCSSBQTVUgZHJpdmVyIGRp
c2FibGVzIGFsbCBQTVUgY291bnRlcnMgZHVyaW5nIGluaXRpYWxpemF0aW9uCj4+Pj4gdmlhIHBt
dV9zYmlfc3RvcF9hbGwuIEZvciBmaXhlZCBjb3VudGVycyBDWUNMRSwgVElNRSBhbmQgSU5TVFJF
VCwgdGhpcyBpcwo+Pj4+IHVubmVjZXNzYXJ5IGZvciB0aGUgZm9sbG93aW5nIHR3byByZWFzb25z
Ogo+Pj4+IAo+Pj4+IDEuIFNvbWUga2VybmVsIGRyaXZlciBjb2RlIG1heSBkaXJlY3RseSByZWFk
IENZQ0xFIGFuZCBJTlNUUkVUIHRvIHBlcmZvcm0KPj4+PiAgICBzaW1wbGUgcGVyZm9ybWFuY2Ug
YW5hbHlzaXMuCj4+PiBJcyB0aGlzIGZvciBzb21lIGRlYnVnZ2luZyBwdXJwb3NlIHRvIHJlYWQg
dGhlIGluc3RyZXQvY3ljbGUgY291bnQgYXQgYm9vdCB0aW1lIG9yIHJlYWwgdXNlIGNhc2UgZm9y
IGRyaXZlciBwZXJmb3JtYW5jZSBhbmFseXNpcyA/Cj4+PiAKPj4+IElmIGl0IGlzIHRoZSBsYXR0
ZXIsIHRoYXQgd2lsbCBiZSBwcm9ibGVtYXRpYyBmb3IgdmFyaW91cyByZWFzb25zIHN1Y2ggYXMg
Y29udGV4dCBzd2l0Y2hpbmcgd2lsbCBsZWFkIHRvIGluYWNjdXJhdGUgbnVtYmVycy4KPj4gSGVs
bG8gQXRpc2guCj4+IAo+PiBCZXNpZGVzIGJvb3QgdGltZSBzY2VuYXJpb3MgYW5kIHBlcmZvcm1h
bmNlIGFuYWx5c2lzLCB0aGVyZSBpcyBhbm90aGVyIGNhc2UKPj4gd2hlcmUgdXNlciBtb2RlIG5l
ZWRzIHRvIGFjY2VzcyB0aGUgY3ljbGUgY291bnRlciB2aWEgcmRjeWNsZS4KPj4gCj4+Pj4gMi4g
SW4gbGVnYWN5IG1vZGUsIHVzZXIgc3BhY2UgZGlyZWN0bHkgcmVhZHMgQ1lDTEUgYW5kIElOU1RS
RVQuIChlY2hvIDIgPgo+Pj4+ICAgIC9wcm9jL3N5cy9rZXJuZWwvcGVyZl91c2VyX2FjY2VzcykK
Pj4+PiAKPj4+PiBUaGVyZWZvcmUsIFdlIGtlZXAgY291bnRpbmcgQ1lDTEUsIFRJTUUgYW5kIElO
U1RSRVQuCj4+Pj4gCj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5h
bGliYWJhLmNvbT4KPj4+PiAtLS0KPj4+PiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8
IDMgKysrCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+PiAKPj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKPj4+PiBpbmRleCA3ZGQyODJkYTY3Y2UuLjkzYWFhYjMyNDQ0MyAxMDA2
NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4+Pj4gKysrIGIvZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+Pj4+IEBAIC04OTksNiArODk5LDkgQEAgc3RhdGlj
IGludCBwbXVfc2JpX2dldF9jdHJpbmZvKGludCBuY3RyLCB1bnNpZ25lZCBsb25nICptYXNrKQo+
Pj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwbXVfc2JpX3N0b3BfYWxsKHN0cnVjdCByaXNjdl9w
bXUgKnBtdSkKPj4+PiAgewo+Pj4+ICsgLyogV2Uga2VlcCBjb3VudGluZyBDWUNMRSwgVElNRSBh
bmQgSU5TVFJFVC4gKi8KPj4+PiArIHBtdS0+Y21hc2sgJj0gfjB4NzsKPj4+PiArCj4+PiBUaGlz
IGlzIGluY29ycmVjdC4gVGhlIGNtYXNrIHNob3VsZCBiZSBzZXQgYmFzZWQgb24gdGhlIHBlcmZf
dXNlcl9hY2Nlc3MgdmFsdWUuIFdlIHNob3VsZCBub3QgY29udGludWUgY291bnRpbmcgdGhlIENZ
Q0xFL0lOU1RSRVQgd2hlbiBsZWdhY3kgbW9kZSBpcyBub3Qgc2V0LiBpZiAoc3lzY3RsX3BlcmZf
dXNlcl9hY2Nlc3MgPT0gU1lTQ1RMX0xFR0FDWSkgY3NyX3dyaXRlKENTUl9TQ09VTlRFUkVOLCAw
eDcpOyBlbHNlIGNzcl93cml0ZShDU1JfU0NPVU5URVJFTiwgMHgyKTsKPj4gTGVnYWN5IG1vZGUg
cmVmZXJzIHRvIHRoZSBwZXJmIGZyYW1ld29yay4gV2hlbiBwZXJmX3VzZXJfYWNjZXNzIGlzIG5v
dCBpbgo+PiBsZWdhY3kgbW9kZSwgdGhlIGFwcGxpY2F0aW9uIG1heSBuZWVkIHRvIHVzZSByZGN5
Y2xlLgo+PiAKPj4gQXMgZGlzY3Vzc2VkIGluIFsxXSwgdGhlIHJkY3ljbGUgaXMgbmVjZXNzYXJ5
LCBhbmQgYXBwbGljYXRpb25zIHN1Y2ggYXMKPj4gRFBESyBzaG91bGQgdXNlIHJkY3ljbGUgaW4g
dXNlciBtb2RlLgo+PiAKPj4gU28gaG93IHRvIHVzZSB0aGUgcmRjeWNsZSB3aGVuIHBlcmZfdXNl
cl9hY2Nlc3MgaXMgbm90IGluIGxlZ2FjeSBtb2RlPwo+PiAKPj4gWzFdIGh0dHBzOi8vbGlzdHMu
cmlzY3Yub3JnL2cvdGVjaC1wcml2aWxlZ2VkL3RvcGljL3Nob3VsZF9yZGN5Y2xlX2JlX2RlcHJl
Y2F0ZWQvMTE1MTYyNzM3Cj4gCj4gQmFzZWQgb24gdGhpcyB0aHJlYWQsIGl0IHdhcyB2ZXJ5IGNs
ZWFyIHRoYXQgdGhlIGRwZGsgdXNlIGNhc2Ugb2YgcmRjeWNsZSBpcyBpbmNvcnJlY3QuCj4gCj4g
V2UgYWxzbyBoYWQgbWFueSBkaXNjdXNzaW9ucyB3aHkgZW5hYmxpbmcgcmRjeWNsZSB3aXRob3V0
IHBlcmYgaXMgYSBiYWQgaWRlYS4gVGhhdCdzIHRoZSByZWFzb24KPiB3aHkgd2UgYWRkZWQgdGhl
ICpzeXNjdGxfcGVyZl91c2VyX2FjY2VzcyogbGVnYWN5IHRvIHByZXNlcnZlIGxlZ2FjeSB1c2Fn
ZS4gRXZlbnR1YWxseSwgaXQgaXMgZXhwZWN0ZWQgdGhhdCBmb2xrcyB3b3VsZCBtb3ZlIGF3YXkg
ZnJvbSByZGN5Y2xlIHVzYWdlIHdoaWNoIHdhcyBpbmNvcnJlY3QgdG8gYmVnaW4gd2l0aC4KPiAK
PiBMZXQgbWUga25vdyBpZiB5b3Ugd2FudCBtZSBkaWcgdXAgdGhlIG9sZCB0aHJlYWRzIGFib3V0
IHRoZSBkaXNjdXNzaW9uLgoKSGkgQXRpc2gsIHRoYW5rcyBmb3IgeW91ciByZXBseS4KCkkgdGhp
bmsgSSBmb3VuZCB0aGUgZWFybGllciBkaXNjdXNzaW9uIHRocmVhZDoKCmh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vYS9ncm91cHMucmlzY3Yub3JnL2cvc3ctZGV2L2MvUkVXY3dZbnpzS0UKCmNv
dWxkIHlvdSBwbGVhc2UgY29uZmlybSB0aGlzIGlzIHRoZSBvbmUgeW91IHdlcmUgcmVmZXJyaW5n
IHRvPwoKSW4gdGhhdCB0aHJlYWQsIHlvdSBtZW50aW9uZWQgeW91IGhhZCBzZW50IGEgcGF0Y2gg
dG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwKYmVoYXZpb3IgYnkgZW5hYmxpbmcgdGhlIENZIGJpdCBp
biBzY291bnRlcmVuLiBIb3dldmVyLCBsb29raW5nIGF0IHRoZQpjdXJyZW50IGNvZGUvYmVoYXZp
b3IsIHNldHRpbmcgQ1kgKGFuZCBJUikgaW4gc2NvdW50ZXJlbiBzZWVtcyB0byBvbmx5CmNvbnRy
b2wgVS1tb2RlIHZpc2liaWxpdHkvcGVybWlzc2lvbiB0byByZWFkIHRoZSBjb3VudGVycyAoYW5k
IGFjY2VzcwpyZWxhdGVkIENTUnMpLiBUaGUgY3ljbGUgY291bnRlciBpdHNlbGYgc3RpbGwgZG9l
c27igJl0IGFwcGVhciB0byBpbmNyZW1lbnQsCndoaWNoIG1ha2VzIG1lIHN1c3BlY3QgbWNvdW50
aW5oaWJpdC5DWSBtaWdodCBzdGlsbCBiZSBzZXQuCgpTbyBJ4oCZbSB3b25kZXJpbmcgd2hldGhl
ciB3ZSBhbHNvIG5lZWQgdG8gZXhwbGljaXRseSB1bi1pbmhpYml0IHRoZSBjeWNsZQpjb3VudGVy
IChlbnN1cmUgbWNvdW50aW5oaWJpdC5DWSA9IDApIGluIHRoZSBsZWdhY3kgcGF0aCBieSBzYmkg
Y2FsbCwgaWYKdGhlIGludGVudCBpcyB0byBwcmVzZXJ2ZSB0aGUgaGlzdG9yaWNhbCByZGN5Y2xl
IGJlaGF2aW9yLgoKPj4gQmVzdCBSZWdhcmRzLAo+PiBRaW5nd2VpIEh1Cj4+IAo+Pj4+ICAgLyoK
Pj4+PiAgICAqIE5vIG5lZWQgdG8gY2hlY2sgdGhlIGVycm9yIGJlY2F1c2Ugd2UgYXJlIGRpc2Fi
bGluZyBhbGwgdGhlIGNvdW50ZXJzCj4+Pj4gICAgKiB3aGljaCBtYXkgaW5jbHVkZSBjb3VudGVy
cyB0aGF0IGFyZSBub3QgZW5hYmxlZCB5ZXQuCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+PiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+IAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
