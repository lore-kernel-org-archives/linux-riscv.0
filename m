Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E2606A327
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pTUn9y5D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlPccw2s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OUxUIKRzaOndvmx/nvNLeH3dBSBoeOAGzKxZNgphbEg=; b=pTUn9y5DIpvqJpSqaXV0bs+q3l
	sk88AatF1/34/Amyl/F+91NuGgVjaP+MqiLlAjCg8KuobdZE0XTPh6sYVdgZniuoQ0gX2qefh+d/F
	aP6w9AQ3cyxrWv897fADBKEOZWbSKC4+hGbF52fXJQ5AcEVBPixAzDAUc4yEzpkcomyfENcsMx7lW
	cfYVgYfFcp/PFk3BlcHylwj7refyR/fVFWb+6boX5Si6L93cIV2nKY2tqJNet76ZzSLMlEpvlaYhj
	Upqz4xZNk5eoiIcO+OhEKukmmFaYme0hUR3ncjaK+DTZMORABVb7+KmuQ0b7dmzR5G4tEwR5uc8j3
	bPcHLpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrXc-0000000Czbz-21nX;
	Fri, 13 Nov 2026 13:42:08 +0000
Received: from mail-wm2-x09.google.com ([2a00:1450:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrXa-0000000CzZy-1x3Z
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:42:07 +0000
Received: by mail-wm2-x09.google.com with SMTP id 5b1f17b1804b1-4b76ade741cso3203645e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 05:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794577324; x=1795182124; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oyo60OYFmXZXL90Hj9PED7vL+lEsAHp4eJo0r71AKr0=;
        b=dlPccw2sleGSG16Ccsn2ed/1lWVvcg01+ZfljY+5pQmvN1BbGNLuUqSjzGMmvb4off
         FJZe4nG6CGIedKVXTAhpqlEQKc0yaP/iU5F5BFFinCH/SkNkNeVSdIgGT2UHNqHxOxlg
         Ku4dgxdS3zrF6ZSjZ18uhefHP+psM09qn3ifX1yawJ4OsD37MXeWHYLDIaI+PKjkoWPr
         A6Ah4ZkQwAMW/yi46JEbNyxv9pVpN/A1ECSAr1HUNNr24Bi/bKTwqPfNrkVUICnGvRVG
         Chvi4xSgWqBbvS/rR5XXADOqfl6ma0AaZbAMvoyRUoCIi+7oLV/an5uzr0mbnpK+r0wm
         xX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577324; x=1795182124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oyo60OYFmXZXL90Hj9PED7vL+lEsAHp4eJo0r71AKr0=;
        b=DNzkrXYkNVpIBl5XpbCV8+rqszNTuemNKEWxGpaYCcA9UsabQTRvVXSGb4Sr/WUKoT
         VpzfA6qlf9kCFUiydP3juWXMjllXVJ5+vj6rDjHjxB8vqw+MKSXR5Ppa98+VMlGee1Lr
         6ogyI/BYnGttWdl9wdS6nwwOu3J8e+cihIdGWdqO4uAUnVvgJAoQ+6dtgzIAfpEQHci6
         vfMQ2MrisHZQSNxI8YYGd9c0A4OuC6E+Espphz0Txr4PW862Ep9fwsOI98j1VNuX0R77
         Hhhe0X3VU0sXuxJ/iKMxFiyu7oraWsEm+1k3P/ELqk5ipsldvit9gThe8cnb8nlXbbiU
         843A==
X-Forwarded-Encrypted: i=1; AL+hErFLgViMH8p8iZMcVLO8C9wgjcmJpIA4/DK6T1nxv5+jqUkumu05idbcaDIBElOxqZjpucrHjO08S8M3Yw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+hq4t0oOEH4X3zlaQiLT0OnUtoWb6+dF1w9rFcPKmLwVHpvBy9
	sNlXlo/EAcTn83zdhH0SnQ6rsTOKHS+H0vTvVBXiBxhZjcPlp7sGfjmP
X-Gm-Gg: AYBFou1ZnWEfFVkYJIO9MO9DVTG946Nt2hnw60TVdMQECX6wnA2Oh5tVKK7zs0ZcWK9
	wIrL4wPAEdLxOSqDGxA9kW98ircdKZIymnE8eNkKuUiumWrRZEM+zPfn1yAJwCnTI/UfEd4Oijg
	8w0ivEb0H1eRCsuVRAGshffBmTdteEEOF7xd1BqF5DsDJZGYqHp8//qgCF19jyXplFn+IHq/lFs
	1Ixr3Ob1/lQmOr7slgfiFimgyUt1PgUjl0St7OV5lqL6GA/E7YtjWOOvKAnum+1doe9PL9rxGrB
	lpQDCi/3gIY17S97eg+HZkl/20uLhlPBva6ceOOKFPmBCpvVd5Y6bDaXyMu5aTD+cOTEyE1PuSd
	ld4A1eECHqFsjhVvR15CSRZ9tclEU8P5T/gly1KkgnXstgE6qqg3dSMuSTRYwD6IqjgAMI5IAEA
	Zl/axzVaqWLg5UjjLSc4vVJEBxHt4pqb9W4NdtV9casO3cQPApenRLKD2mq1MKSU85+EPihwaiB
	rqUCtCiOtSnfMnhjoOSOD17sziWe//YDg36RSes7s6AOSIJZD0kXmtgouT2J7YP2JPxn5JO9vk6
	AVEGhUw8NP5qn3OMq3g+Chil81oDzh6+eu0dYPQkMPBH8NVV8GzwRRYc6f8=
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr52996795e9.13.1794577323783;
        Fri, 13 Nov 2026 05:42:03 -0800 (PST)
Received: from [192.168.100.182] ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5085715f8f.21.2026.11.13.05.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:42:02 -0800 (PST)
Message-ID: <5ccd1e39-94f0-4e02-87d2-aae8985d1b12@gmail.com>
Date: Fri, 13 Nov 2026 18:41:58 +0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Add KASAN shadow mapping to flush_cache_vmap()
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Muchun Song <muchun.song@linux.dev>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261102134422.610837-1-alitariq45892@gmail.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <20261102134422.610837-1-alitariq45892@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_054206_533489_610322BF 
X-CRM114-Status: GOOD (  19.77  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

R2VudGxlIHBpbmcgb24gdGhpcyBmaXguIE11Y2h1biBoYXMgYWNrZWQgaXQuIEl0IGZpeGVzIGEg
Ym9vdCBjcmFzaCBvbgpyaXNjdiBLQVNBTiBrZXJuZWxzICgyIG9mIDMwIGJvb3RzIG9uIE9yYW5n
ZSBQaSBSVjIpLiBDb3VsZCBpdCBnbyBpbiAKdGhyb3VnaCB0aGUgcmlzY3YgZml4ZXMgYnJhbmNo
PwoKVGhhbmtzLApBbGkgVGFyaXEKCk9uIDExLzIvMjYgNjo0NCBQTSwgQWxpIFRhcmlxIHdyb3Rl
Ogo+IGZsdXNoX2NhY2hlX3ZtYXAoKSBzZXRzIGEgcGVyLUNQVSBmbGFnLCBhbmQgYSBrZXJuZWwg
cGFnZSBmYXVsdAo+IHRoYXQgZmluZHMgdGhlIGZsYWcgc2V0IGdldHMgYW4gc2ZlbmNlLnZtYSBh
bmQgYSByZXRyeS4KPiBmbHVzaF9jYWNoZV92bWFwKCkgb25seSBzZXRzIHRoZSBmbGFnIGZvciB2
bWFsbG9jLCBtb2R1bGUgYW5kIHZtZW1tYXAKPiByYW5nZXMuIGthc2FuX3BvcHVsYXRlX3ZtYWxs
b2MoKSBtYXBzIG5ldyBzaGFkb3cgcGFnZXMgYW5kIGNhbGxzCj4gZmx1c2hfY2FjaGVfdm1hcCgp
IG9uIHRoZSBzaGFkb3cgcmFuZ2UsIHNvIG5vIGZsYWcgZ2V0cyBzZXQuCj4gRm9yIHZtYXAoKS1z
dHlsZSBhcmVhcywga2FzYW5fdW5wb2lzb25fdm1hbGxvYygpIHdyaXRlcwo+IHRoZSBuZXcgc2hh
ZG93IHJpZ2h0IGF3YXkuIElmIHRoZSBDUFUgaGFzbuKAmXQgc2VlbiB0aGUgbmV3IGVudHJ5IHll
dCwKPiB0aGUgc3RvcmUgZmF1bHRzLCBhbmQgc2luY2UgdGhlcmUgaXMgbm8gZmxhZyBzZXQsIHRo
ZSBrZXJuZWwgY3Jhc2hlcy4KPiAKPiBbICAgIDAuNjc1MjE2XSBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZmZmZmZjdjMDA5YTAwMAo+
IEN1cnJlbnQgc3dhcHBlci8wIHBndGFibGU6IDRLIHBhZ2VzaXplLCAzOS1iaXQgVkFzLCBwZ2Rw
PTB4MDAwMDAwMDAwNDUwNDAwMAo+IFtmZmZmZmZmN2MwMDlhMDAwXSBwZ2Q9MDAwMDAwMDA5ZmY2
ZTAwMSwgcDRkPTAwMDAwMDAwOWZmNmUwMDEsIHB1ZD0wMDAwMDAwMDlmZjZlMDAxLCBwbWQ9MDAw
MDAwMDA0MDBlNzQwMSwgcHRlPTAwMDAwMDAwNDAzY2IwZTcKPiBzdGF0dXM6IDAwMDAwMDAyMDAw
MDAxMjAgYmFkYWRkcjogZmZmZmZmZjdjMDA5YTAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgo+
IF9fbWVtc2V0KzB4NjAvMHhmZQo+IGthc2FuX3VucG9pc29uKzB4MjYvMHg0ZQo+IF9fa2FzYW5f
dW5wb2lzb25fdm1hbGxvYysweDIwLzB4MmUKPiBfX2dldF92bV9hcmVhX25vZGUrMHgxYzYvMHgy
NzYKPiBnZXRfdm1fYXJlYV9jYWxsZXIrMHg1Mi8weDg0Cj4gdm1hcCsweGYwLzB4MjY0Cj4gZG1h
X2NvbW1vbl9jb250aWd1b3VzX3JlbWFwKzB4YTAvMHhkMAo+IGF0b21pY19wb29sX2V4cGFuZCsw
eGI2LzB4MzEwCj4gX19kbWFfYXRvbWljX3Bvb2xfaW5pdC5pc3JhLjArMHhmNi8weDFjMAo+IGRt
YV9hdG9taWNfcG9vbF9pbml0KzB4ZjYvMHgxYWEKPiBkb19vbmVfaW5pdGNhbGwrMHgxMzQvMHg5
MjgKPiBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDUzMi8weDYwYQo+IGtlcm5lbF9pbml0KzB4Mjgv
MHgxNjIKPiByZXRfZnJvbV9mb3JrX2tlcm5lbCsweDgyLzB4OTRjCj4gcmV0X2Zyb21fZm9ya19r
ZXJuZWxfYXNtKzB4MTYvMHgxOAo+IAo+IFRoZSBQVEUgaXMgdmFsaWQsIHNvIHRoZSBtYXBwaW5n
IHdhcyBpbiBwbGFjZSB3aGVuIHRoZSBDUFUgZmF1bHRlZC4KPiAKPiBUZXN0ZWQgb24gT3Jhbmdl
IFBpIFJWMjogd2l0aG91dCB0aGlzIHBhdGNoIDIgb2YgMzAgYm9vdHMgY3Jhc2hlZCwKPiB3aXRo
IGl0IDUwIG9mIDUwIGJvb3RlZC4KPiAKPiBBZGQgdGhlIEtBU0FOIHNoYWRvdyByZWdpb24gdG8g
dGhlIHJhbmdlcyBmb3Igd2hpY2ggZmx1c2hfY2FjaGVfdm1hcCgpCj4gY2FsbHMgbWFya19uZXdf
dmFsaWRfbWFwKCksIGFzIGNvbW1pdCA0ZWRkNzBlZTZhN2QgKCJtbS9zcGFyc2Utdm1lbW1hcDoK
PiBmbHVzaF9jYWNoZV92bWFwKCkgYWZ0ZXIgaG90cGx1Z2dpbmcgdm1lbW1hcCIpIGRpZCBmb3Ig
dm1lbW1hcC4KPiAKPiBGaXhlczogNTAzNjM4ZTBiYWJmICgicmlzY3Y6IFN0b3AgZW1pdHRpbmcg
cHJldmVudGl2ZSBzZmVuY2Uudm1hIGZvciBuZXcgdm1hbGxvYyBtYXBwaW5ncyIpCj4gU2lnbmVk
LW9mZi1ieTogQWxpIFRhcmlxIDxhbGl0YXJpcTQ1ODkyQGdtYWlsLmNvbT4KPiAtLS0KPiBDcmFz
aCBMb2c6IGh0dHBzOi8va2VybmVsY2kuY2xvdWQtdi5jby9zY2hlZHVsZXIvam9iLzU0MQo+IC0t
LQo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCA2ICsrKysrLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gaW5kZXggYzJiMGEyOTI4ZjA2Li5jOTViMmY2MDA3
ZmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+IEBAIC04LDYgKzgsOCBA
QAo+ICAgCj4gICAjaW5jbHVkZSA8bGludXgvbW0uaD4KPiAgIAo+ICsjaW5jbHVkZSA8YXNtL2th
c2FuLmg+Cj4gKwo+ICAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwo
dm9pZCkKPiAgIHsKPiAgIAlhc20gdm9sYXRpbGUgKCJmZW5jZS5pIiA6OjogIm1lbW9yeSIpOwo+
IEBAIC01Nyw3ICs1OSw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtYXJrX25ld192YWxpZF9tYXAo
dm9pZCkKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92bWFwKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICAgewo+ICAgCWlmIChpc192bWFsbG9jX29y
X21vZHVsZV9hZGRyKCh2b2lkICopc3RhcnQpIHx8Cj4gLQkgICAgKHN0YXJ0ID49IFZNRU1NQVBf
U1RBUlQgJiYgZW5kIDw9IFZNRU1NQVBfRU5EKSkKPiArCSAgICAoc3RhcnQgPj0gVk1FTU1BUF9T
VEFSVCAmJiBlbmQgPD0gVk1FTU1BUF9FTkQpIHx8Cj4gKwkgICAgKElTX0VOQUJMRUQoQ09ORklH
X0tBU0FOKSAmJgo+ICsJICAgICBzdGFydCA+PSBLQVNBTl9TSEFET1dfU1RBUlQgJiYgZW5kIDw9
IEtBU0FOX1NIQURPV19FTkQpKQo+ICAgCQltYXJrX25ld192YWxpZF9tYXAoKTsKPiAgIH0KPiAg
ICNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcF9lYXJseShzdGFydCwgZW5kKQlsb2NhbF9mbHVzaF90
bGJfa2VybmVsX3JhbmdlKHN0YXJ0LCBlbmQpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
