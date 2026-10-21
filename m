Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14150606A31D
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vAEk858b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xsaf5ppa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0Lmrq3KwnadMksh00KdERbtciTznXMzqRVbMgfQZMQ=; b=vAEk858bXiw912
	ffXeUFK3BhbWpo2PZIQ8tI7Qx94YNsCxVZ2EVQY/4VVGuUS0uOBTAoFdqXoMH9ePzMD2QwhgHjJmO
	lr8s3QZW7jrRLzvx/eD+RWrLJW/1Msbu6jkgYZG5sQ/DWUV50xeb9rbE6vZDQa39TQHcNhE7ja4Dl
	xwCRh8UdgBRWLWvEJ/b0tbbtmcat+4AFC293d+9hDo2lH96/bt+Wyk5wk2Nh5okvcIAFhGI7RprTf
	pAHQ+BOS1SWxb0tkR9hwlj/4ZM96/QNH/W4g9feswGIqNA1vDw8d1MzVYp5WXluLnrWFuVsoLNzfY
	SCT62Zg806dp6jY6RPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSwP-0000000BWz7-3JbL;
	Wed, 21 Oct 2026 09:49:01 +0000
Received: from mail-pj2-f10.google.com ([74.125.227.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSwM-0000000BWyJ-1LQM
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 09:48:59 +0000
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso2703225ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576137; x=1793180937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
        b=Xsaf5ppa7LFsOQGPq9QOpzqt4Dv5wzKyElTo0JQOr9eW5kRpufU51Nkuij5kywZ8if
         /KGBrodSSyXakbFdVBVmfdeAF72RheyupBKq2XbkOip5LbBXl3uFwI/1v+1C2LbwzpSi
         wdlsD9IbeKTZztMkd8/BnRqCo8/DJPz13u3BnxHE4Nc85HkdtHe1vo+7AQMTFc90Ex++
         DQpdyEUPLEUrqYthVJPBfvAwhXbuN8gflSW+7DVh9xZBjDYq+Al4o4NMCpJWyZ0sKeNd
         2boDP5cKPh5UaHAAu4EeJ7YOe72PoZMY32qyEny6MGSzZ8lpL90frgsZA2cJBogjSgMY
         p6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576137; x=1793180937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
        b=W77UIrY8BK04aXtWDR6DDuGO5ArN0/3Y1tj4lLypuAiR90m4sjZvyoQd9btBVtB46j
         k0BREVy2Vle8oevOLW9dqpf6ORzDHRPBvGHJYMVZi2sKjaXhT+lBeBzV88mkrUTvzwKy
         QaNyylQV4GqduJH7Y+oAMPeTRnEfGkSfuTrmIX1IJnAlkhAPBnDXA/J+dnc4JvMc5QKl
         zfUSuWAZ/TVG3E2CFX0BY4Hwd7JO51XGC7vRWDgatpdbeNSTcltRJKZT2rS3D/Mk4+S3
         MskmmPFsw912/H9XG1f8jGseuiqaWbyOTASHrzz+3H42udDhz24j+QFtVJVpZXzO/y2d
         0xhA==
X-Forwarded-Encrypted: i=1; AKwUvBzDLvG9MMdAStXZyaIafzQOvF1+AezDVs1ZhN7qvn1vAzo4i/YxBZWDPe82fWOwAfrhrD3rKrifAcdsSw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJk/V67QKNMzdTdL3nU5rl0llIs+gs+ovrOLB5/FZvW3e7ws4P5
	A/gJ+sP2MkA6DZtiuNxLq8zA2Om4WTjNWdYhynyIQuWD8fY2WPsmfF2C
X-Gm-Gg: AYBFou0VRGWRGzeGEcWnSyX7ABodXWOPtDgC8j8pPI9fBuOAUGeSlWNAnHMqiQ5MDI6
	fsOrlPx77qiHtc1lUXjcVR6UFSsAlQz4EFICNG2ln+i8dwCAlNAFNzlTmHSAPeCgGid2lJaRwse
	JH4PSSlPET1Gos+Zd7OcIBNaWPKdhT1uZ45s4GPufMaCTjX75DY/fmR9QpV589sscC9M7DTYHva
	lCSl8jX5diJckFEVO2KxdTXEh0px/d5YgEVliL0a8ZCT6NfsCF3xQi0tHA0ZMuca6IsHMfZHKcz
	MQ2Zx22yLHVPoCY33OilANHggRY3SzW4ZyWVAmfLLc8tIkrovDTzhXDVZPYQRKcIAtYBcRSUVG5
	i4vni53/SfvclRUaKVizMyfxBQvKLWT1a9YgwGDvmtlySGcWJeonX2x0PIlQWnEAz8gGGKpmmet
	Fwt0nBEIWKuABDdOeZAkrhYb6rXsNHGQPmCu8iDbBBbxxoclkRYxQ2fwnW6egaPvasgvI1noOVu
	QsdaoMaJabuZvpgGtT6UTAKN1SzUFPgtOVNjbwsVzFvMwGRMbQKTsZhjVUa/Xk=
X-Received: by 2002:a17:902:f60e:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2ea43a13e4fmr10496695ad.20.1792576137131;
        Wed, 21 Oct 2026 02:48:57 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486970sm8858055ad.62.2026.10.21.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:48:56 -0700 (PDT)
Message-ID: <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
Date: Wed, 21 Oct 2026 17:48:37 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Jinjie Ruan <ruanjinjie@huawei.com>, robh@kernel.org,
 baoquan.he@linux.dev, rppt@kernel.org, m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
 <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_024858_368486_9AEE9460 
X-CRM114-Status: GOOD (  21.08  )
X-Spam-Score: -1.7 (-)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMC8yMS8yNiAxNzoxMywgSmluamllIFJ1YW4gd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjYv
MTAvMjEgMTY6MzAsIFdhbmR1biBDaGVuIOWGmemBkzoKPj4gRnJvbTogV2FuZHVuIENoZW4gPGNo
ZW53YW5kdW5AbGl4aWFuZy5jb20+Cj4+Cj4+IGNyYXNoX3ByZXBhcmVfaGVhZGVycygpIGNvdW50
cyBtZW1vcnkgcmFuZ2VzIGJlZm9yZSBwb3B1bGF0aW5nIHRoZQo+PiBhbGxvY2F0ZWQgY3Jhc2hf
bWVtIGFycmF5LiBUaGUgd2VhayBpbXBsZW1lbnRhdGlvbiB1c2VkIGJ5IEFSTTY0LAo+PiBSSVND
LVYgYW5kIExvb25nQXJjaCB3YWxrcyBtZW1ibG9jay5tZW1vcnksIHdoaWxlIHg4NiBwZXJmb3Jt
cyB0aGUgc2FtZQo+PiB0d28tcGFzcyBvcGVyYXRpb24gb3ZlciBzeXN0ZW0gUkFNIHJlc291cmNl
cy4gQ29uY3VycmVudCBtZW1vcnkgaG90cGx1Zwo+PiBjYW4gY2hhbmdlIHJhbmdlIHNvdXJjZSBi
ZXR3ZWVuIHRoZSB0d28gd2Fsa3MgYW5kIG1ha2UgdGhlIHBvcHVsYXRlCj4+IHBhc3Mgb3ZlcmZs
b3cgY21lbS0+cmFuZ2VzLgo+Pgo+PiBUYWtlIGRldmljZV9ob3RwbHVnX2xvY2sgd2hlbiBwcmVw
YXJpbmcgY3Jhc2ggaGVhZGVycyBkdXJpbmcKPj4ga2V4ZWNfZmlsZV9sb2FkKCkuIFRoZSB4ODYv
cmlzY3YgbWVtb3J5IGhvdHBsdWcgcGF0aCBhbHJlYWR5IHRha2VzCj4+IGRldmljZV9ob3RwbHVn
X2xvY2ssIHNvIGNhbGwgX19jcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBkaXJlY3RseQo+PiB0byBh
dm9pZCByZWN1cnNpdmUgbG9ja2luZy4KPj4KPj4gU2FzaGlrbyByZXBvcnRlZCB0aGlzIGlzc3Vl
IGluIFsxXS4KPj4KPj4gRml4ZXM6IDM3NTFlNzI4Y2VmMiAoImFybTY0OiBrZXhlY19maWxlOiBh
ZGQgY3Jhc2ggZHVtcCBzdXBwb3J0IikKPj4gRml4ZXM6IDFiY2NhODYyMGE5MSAoIkxvb25nQXJj
aDogQWRkIGNyYXNoIGR1bXAgc3VwcG9ydCBmb3Iga2V4ZWNfZmlsZSIpCj4+IEZpeGVzOiA4YWNl
YTQ1NWZhZmEgKCJSSVNDLVY6IFN1cHBvcnQgZm9yIGtleGVjX2ZpbGUgb24gcGFuaWMiKQo+PiBG
aXhlczogZGQ1ZjcyNjA3NmNjICgia2V4ZWM6IHN1cHBvcnQgZm9yIGtleGVjIG9uIHBhbmljIHVz
aW5nIG5ldyBzeXN0ZW0gY2FsbCIpCj4+IFNpZ25lZC1vZmYtYnk6IFdhbmR1biBDaGVuIDxjaGVu
d2FuZHVuQGxpeGlhbmcuY29tPgo+PiBMaW5rOiBodHRwczovL3Nhc2hpa28uZGV2LyMvbWVzc2Fn
ZS8yMDI2MDgwNjEwMTAwMi4xRjg0RTFGMDAwRTlAc210cC5rZXJuZWwub3JnIFsxXQo+PiBBY2tl
ZC1ieTogQmFvcXVhbiBIZSA8YmFvcXVhbi5oZUBsaW51eC5kZXY+Cj4+IC0tLQo+PiAgYXJjaC9y
aXNjdi9rZXJuZWwvY3Jhc2guYyAgfCAgMiArLQo+PiAgYXJjaC94ODYva2VybmVsL2NyYXNoLmMg
ICAgfCAgMiArLQo+PiAgaW5jbHVkZS9saW51eC9jcmFzaF9jb3JlLmggfCAgMiArKwo+PiAga2Vy
bmVsL2NyYXNoX2NvcmUuYyAgICAgICAgfCAxNyArKysrKysrKysrKysrKystLQo+PiAgNCBmaWxl
cyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NyYXNo
LmMKPj4gaW5kZXggZmU1YTRiMzA2YWFlLi5hYzhkZjJlZGYyYTcgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NyYXNoLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2gu
Ywo+PiBAQCAtNzAsNyArNzAsNyBAQCB2b2lkIGFyY2hfY3Jhc2hfaGFuZGxlX2hvdHBsdWdfZXZl
bnQoc3RydWN0IGtpbWFnZSAqaW1hZ2UsIHZvaWQgKmFyZykKPj4gIAkgKiBDcmVhdGUgdGhlIG5l
dyBlbGZjb3JlaGRyIHJlZmxlY3RpbmcgdGhlIGNoYW5nZXMgdG8gQ1BVIGFuZC9vcgo+PiAgCSAq
IG1lbW9yeSByZXNvdXJjZXMuCj4+ICAJICovCj4+IC0JaWYgKGNyYXNoX3ByZXBhcmVfaGVhZGVy
cyh0cnVlLCAmZWxmYnVmLCAmZWxmc3osIE5VTEwpKSB7Cj4+ICsJaWYgKF9fY3Jhc2hfcHJlcGFy
ZV9oZWFkZXJzKHRydWUsICZlbGZidWYsICZlbGZzeiwgTlVMTCkpIHsKPj4gIAkJcHJfZXJyKCJ1
bmFibGUgdG8gY3JlYXRlIG5ldyBlbGZjb3JlaGRyIik7Cj4+ICAJCWdvdG8gb3V0Owo+PiAgCX0K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcmFzaC5jIGIvYXJjaC94ODYva2VybmVs
L2NyYXNoLmMKPj4gaW5kZXggZTZmMjM5MzNhNmRmLi5iZWYwMDhhMGNiMjIgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gveDg2L2tlcm5lbC9jcmFzaC5jCj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9jcmFz
aC5jCj4+IEBAIC00NjUsNyArNDY1LDcgQEAgdm9pZCBhcmNoX2NyYXNoX2hhbmRsZV9ob3RwbHVn
X2V2ZW50KHN0cnVjdCBraW1hZ2UgKmltYWdlLCB2b2lkICphcmcpCj4+ICAJICogQ3JlYXRlIHRo
ZSBuZXcgZWxmY29yZWhkciByZWZsZWN0aW5nIHRoZSBjaGFuZ2VzIHRvIENQVSBhbmQvb3IKPj4g
IAkgKiBtZW1vcnkgcmVzb3VyY2VzLgo+PiAgCSAqLwo+PiAtCWlmIChjcmFzaF9wcmVwYXJlX2hl
YWRlcnMoSVNfRU5BQkxFRChDT05GSUdfWDg2XzY0KSwgJmVsZmJ1ZiwgJmVsZnN6LCBOVUxMKSkg
ewo+PiArCWlmIChfX2NyYXNoX3ByZXBhcmVfaGVhZGVycyhJU19FTkFCTEVEKENPTkZJR19YODZf
NjQpLCAmZWxmYnVmLCAmZWxmc3osIE5VTEwpKSB7Cj4+ICAJCXByX2VycigidW5hYmxlIHRvIGNy
ZWF0ZSBuZXcgZWxmY29yZWhkciIpOwo+PiAgCQlnb3RvIG91dDsKPj4gIAl9Cj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2NyYXNoX2NvcmUuaCBiL2luY2x1ZGUvbGludXgvY3Jhc2hfY29y
ZS5oCj4+IGluZGV4IGJjMDg3MTI0Y2Q3OC4uMjhlN2E4MWNmMjYzIDEwMDY0NAo+PiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2NyYXNoX2NvcmUuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2NyYXNoX2Nv
cmUuaAo+PiBAQCAtNjEsNiArNjEsOCBAQCBleHRlcm4gaW50IGNyYXNoX3ByZXBhcmVfZWxmNjRf
aGVhZGVycyhzdHJ1Y3QgY3Jhc2hfbWVtICptZW0sIGludCBuZWVkX2tlcm5lbF9tYQo+PiAgCQkJ
CSAgICAgICB2b2lkICoqYWRkciwgdW5zaWduZWQgbG9uZyAqc3opOwo+PiAgZXh0ZXJuIGludCBj
cmFzaF9wcmVwYXJlX2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsCj4+
ICAJCQkJIHVuc2lnbmVkIGxvbmcgKnN6LCB1bnNpZ25lZCBsb25nICpucl9tZW1fcmFuZ2VzKTsK
Pj4gK2ludCBfX2NyYXNoX3ByZXBhcmVfaGVhZGVycyhpbnQgbmVlZF9rZXJuZWxfbWFwLCB2b2lk
ICoqYWRkciwgdW5zaWduZWQgbG9uZyAqc3osCj4+ICsJCQkgICAgdW5zaWduZWQgbG9uZyAqbnJf
bWVtX3Jhbmdlcyk7Cj4+ICBleHRlcm4gaW50IGNyYXNoX2V4Y2x1ZGVfY29yZV9yYW5nZXMoc3Ry
dWN0IGNyYXNoX21lbSAqKmNtZW0pOwo+PiAgCj4+ICBzdHJ1Y3Qga2ltYWdlOwo+PiBkaWZmIC0t
Z2l0IGEva2VybmVsL2NyYXNoX2NvcmUuYyBiL2tlcm5lbC9jcmFzaF9jb3JlLmMKPj4gaW5kZXgg
ZmFhMGYyMmRiYjQxLi44YTg2MWE5NDZlMjYgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5lbC9jcmFzaF9j
b3JlLmMKPj4gKysrIGIva2VybmVsL2NyYXNoX2NvcmUuYwo+PiBAQCAtMTYsNiArMTYsNyBAQAo+
PiAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvY3B1aG90cGx1Zy5o
Pgo+PiAgI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZGV2
aWNlLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgva21lbWxlYWsuaD4KPj4gICNpbmNsdWRlIDxsaW51
eC9jcmFzaF9jb3JlLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvcmVib290Lmg+Cj4+IEBAIC0zNDQs
OCArMzQ1LDggQEAgaW50IGNyYXNoX2V4Y2x1ZGVfY29yZV9yYW5nZXMoc3RydWN0IGNyYXNoX21l
bSAqKmNtZW0pCj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gLWludCBjcmFzaF9wcmVwYXJl
X2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcg
KnN6LAo+PiAtCQkJICB1bnNpZ25lZCBsb25nICpucl9tZW1fcmFuZ2VzKQo+PiAraW50IF9fY3Jh
c2hfcHJlcGFyZV9oZWFkZXJzKGludCBuZWVkX2tlcm5lbF9tYXAsIHZvaWQgKiphZGRyLCB1bnNp
Z25lZCBsb25nICpzeiwKPj4gKwkJCSAgICB1bnNpZ25lZCBsb25nICpucl9tZW1fcmFuZ2VzKQo+
PiAgewo+PiAgCXVuc2lnbmVkIGludCBtYXhfbnJfcmFuZ2VzOwo+PiAgCXN0cnVjdCBjcmFzaF9t
ZW0gKmNtZW07Cj4+IEBAIC0zODIsNiArMzgzLDE4IEBAIGludCBjcmFzaF9wcmVwYXJlX2hlYWRl
cnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+
PiAgCXJldHVybiByZXQ7Cj4+ICB9Cj4+ICAKPj4gK2ludCBjcmFzaF9wcmVwYXJlX2hlYWRlcnMo
aW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+PiAr
CQkJICB1bnNpZ25lZCBsb25nICpucl9tZW1fcmFuZ2VzKQo+PiArewo+PiArCWludCByZXQ7Cj4+
ICsKPj4gKwlsb2NrX2RldmljZV9ob3RwbHVnKCk7Cj4+ICsJcmV0ID0gX19jcmFzaF9wcmVwYXJl
X2hlYWRlcnMobmVlZF9rZXJuZWxfbWFwLCBhZGRyLCBzeiwgbnJfbWVtX3Jhbmdlcyk7Cj4+ICsJ
dW5sb2NrX2RldmljZV9ob3RwbHVnKCk7Cj4gCj4gSSB0aGluayB0aGlzIHBhdGNoIGNvbmZsaWN0
cyB3aXRoIG15IGNoYW5nZXMgYW5kIHdvdWxkIGFsc28gY29uZmxpY3QKPiB3aXRoIHRoZSBpbXBs
ZW1lbnRhdGlvbiBvZiBhcm02NCBjcmFzaCBob3RwbHVnLgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MDkyMTA5MDQ1MC44MDc1NzUtMTUtcnVhbmppbmppZUBodWF3ZWkuY29t
Lwo+IApIYXZlIHRoZXNlIHBhdGNoZXMgYWxyZWFkeSBiZWVuIG1lcmdlZD8gTXkgY3VycmVudCB3
b3JrIGlzIGJhc2VkIG9uIHRoZSBsYXRlc3QKbGludXgtbmV4dC4gSWYgdGhleSBoYXZlIGFscmVh
ZHkgYmVlbiBtZXJnZWQgaW50byB0aGUgbWFpbnRhaW5lcidzIGJyYW5jaCwKcGxlYXNlIGxldCBt
ZSBrbm93LCBJIHdpbGwgdXBkYXRlIG15IHRyZWUgYW5kIHJlYmFzZS9yZS1hZGFwdCBteSBjaGFu
Z2VzIGFjY29yZGluZ2x5LgoKCkFsc28sIHJlZ2FyZGluZyB0aGUgY2hhbmdlcyBpbiBrZXJuZWwv
Y3Jhc2hfY29yZS5jOiBpdCBsb29rcyBsaWtlIHdlIG1vZGlmaWVkCnRoZSBzYW1lIHNwb3QsIHRo
ZSBjaGFuZ2UgaXMgbm90IHdyb25nLCBpcyB0aGF0IHJpZ2h0PwoKPiBhcm02NCBjcmFzaCBob3Rw
bHVnOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkxODEwMDQ0Mi4zODQxMTM1
LTE4LXJ1YW5qaW5qaWVAaHVhd2VpLmNvbS8KCkluIGFkZGl0aW9uLCBpZiBhcm02NCBnYWlucyBj
cmFzaCBob3RwbHVnIHN1cHBvcnQsIHRoZSBjb2RlIHRoZXJlIHdvdWxkIGluZGVlZApuZWVkIHRv
IGJlIG1vZGlmaWVkICh0byBhdm9pZCBhIGRlYWRsb2NrKS4gQXMgb2Ygbm93LCBhcm02NCBjcmFz
aCBob3RwbHVnCnN1cHBvcnQgaGFzIG5vdCBiZWVuIG1lcmdlZCB5ZXQgZWl0aGVyLCBoYXMgaXQ/
IEkganVzdCB3YW50IHRvIG1ha2Ugc3VyZSBJCmhhdmVuJ3QgbWlzc2VkIGFueXRoaW5nLgoKPiAK
Pj4gKwo+PiArCXJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4gIC8qKgo+PiAgICogY3Jhc2hfZXhj
bHVkZV9tZW1fcmFuZ2UgLSBleGNsdWRlIGEgbWVtIHJhbmdlIGZvciBleGlzdGluZyByYW5nZXMK
Pj4gICAqIEBtZW06IG1lbS0+cmFuZ2UgY29udGFpbnMgYW4gYXJyYXkgb2YgcmFuZ2VzIHNvcnRl
ZCBpbiBhc2NlbmRpbmcgb3JkZXIKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
