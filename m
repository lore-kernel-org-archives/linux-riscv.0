Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B93C982E0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UXWU/ckrntw3acphzbautyTcv8uQrkVAJsnfeSQS5w=; b=zR4bY5A3BC/4Jn
	k6zGfC5Ejdu+KZaYvdEozfsTYxlKTntoXC4NCB598SF88GkLT8ESjEHeiVh2obMSjGfui11coDz6y
	e/vr0TMxA+OJCM3W4gLE6c2A9xTJA3C6+3BoxAHS+hjYjUQ13Hcd8qlpfmk1iGKUlNcnEfSpaCE78
	602kWPoZewp8KEeiOAWa8uWLont/q3UkyqvC2x4nVAgAh9WxbeyaBl+l8cjfojLHbocuOzFS0gxCD
	CGVIJh+7NqhQLZxRtmDSuyO9iZb0coS2KYpWJWGbyvnSAXJMQqzjjr15mOiHS242Dmicbj0jvy+/p
	N3imur9yy8zXErOIGubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnkW-0000000Eapo-1Wv9;
	Fri, 16 Jan 2026 17:36:40 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnkT-0000000Eaos-2F0p
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 17:36:38 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-50299648ae9so540811cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 09:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768584996; cv=none;
        d=google.com; s=arc-20240605;
        b=gTyl1zlKk+ZR7y+EsonNG44I5rBGgh4fMQt10kjW6TN9QgAA4jSv+CjZ+hMVW6xzaw
         ImYF8kfgAubSylAokkFZ81meWcKDX+p0leRwsDoTmpGlYj8pJ9nUtQu7FOMSK6/US3WA
         /prk7C1EY+WH6EfsaJMaEP8sOvZOZyGS0sCZvYFtpegqR/fldYhTE6/TdgW5hJaXOWhk
         zxsvabRSdG3wAZe6rRg5KTd6Wt3zViVlzpB2r2QKBO+lFQY7mZRYPw1cbt5ctnU6pkHF
         1ZlpCrDtnLwWSMDJPizlU3igharPrLx5U3vQgrqr+A2RCD9TbrERkICiDGk4CqTvI+Y/
         T3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=53uWNErBo7wI6ZcBPOrPDVWa4idMxyXiq3MzbljTtl8=;
        fh=v2dLMIkkyTiaT3c2/Ik3X2IJCsi+hCNt2ooFSp6h/30=;
        b=M6xomTc0CpOxDeA/ie7QBlb6jcgtnb61tXSfpmRgSXR8ICDHVip5ev04eWtjy5xrsw
         eSD/0QFcGi6Gy/VtbkifJFLCnWZHELSh8Qnsd3E2ozE2Bfxrf9TwZln20yui0B8uLucY
         nBZIKBuFFAFC9I0ZJec6xb9/3nFfjhalZNaWv/aBfUtB2787FMCd3SHyv9TjJ/Mtjpuk
         8u4EuSg0KvyrMc/Id3rm5MqYIueq/nhR3TTqizSvftSS9AZ/krvhajk2EdnhJeIaGXYo
         aFJiIOGWPZY2enEfUP/dLpMTOXzVVJPNQF8TRa0i0y/pkO4yPU4Ad+VNHlvbTP1/+LTH
         7bGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768584996; x=1769189796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53uWNErBo7wI6ZcBPOrPDVWa4idMxyXiq3MzbljTtl8=;
        b=tpodG8OwVUfGOs2ByaE9+hKDgJXSPx9b2OirBcSEaGBeYrw0632KBSCfeRZUTSjIkB
         Mxtys61EBgDae1sF0bvpO8gEiCoPuBBzrVC9QVUWqbDAMJNa/CsTrsml6F38kC/gUHpN
         zn+I/6dbgYIO1XHJ34nVhr6x2M3Wr3NeKJjtkdIvTHDRBrTKN9LKGrn4R/TtPKht4MSz
         u2U1lPRqL5MU5S8nvZw8boyjFX1TfOmIDPG4AdRngwIBo+nw0eYCtSKYGZPL4biVDaDC
         gHEmaAfGmO/H+bvN9i25xjAAnnt7pz/lH0dIehYZLug0xiXFspNn1xQLmoQs7zhyTfq7
         CFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584996; x=1769189796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53uWNErBo7wI6ZcBPOrPDVWa4idMxyXiq3MzbljTtl8=;
        b=FmY5E+QF1VLHQsfRsL4FrkjOejFi8fo17tNA8xWsCHp3s1l2FoySN2gWXGIB1GeVBX
         26n9qsX2KotrLccrVtAEB+WQjDW0Nx7ve4+75yvRXNqVdrrR9xDb6vGTVwODbDh6oTIY
         vUe4PmOzPFEk00Qavwes5qONFtDJg5hEkRM2n27lcSkGkWDqkSlWIA9E7FRTfiLJvazS
         XRBtrqhONptGDWNlLuHDElGsouIqS0jaqLkoku5rCWt6KC3DvD3yVMfExpRjelxJq1no
         9pFyG7Mzyqw0K9jjBjmFEwhSRrpB0/77+3B+xS5K+3dUrnFW0OBaeIU0AIk1Arv2aNKz
         EfxA==
X-Gm-Message-State: AOJu0YyvEuAFI30r5At6GK17saCf3+vMVK8p+qyAquXwR+Srf4Du4BfE
	ZUxifDMUaNmSOHgZlQUObRuWKe29QHuL5X6SMOAlvP0rs0imUhYkt0MiTMsklgn7QJqOniLV6PO
	aAwFKpwbyNCSbOD1ozsHwkKTaSxKnnFdUM0Q8r67mfMIq/ckPDJVP9/rIPwQ=
X-Gm-Gg: AY/fxX7UK+9u8OTHrB7b0o8WT6O5v5l/6GngH/CGsVHC5cSaTL2MyozJKnOTiSU0laK
	XiO1AUplv7IhjCO7tvUzgJ2f+He6RRY+ww+TbgaVtoje6awqqAfM/jhmE8K24XZMPwT6vady33x
	1n0AxVwRSmeDB83sKkjIl9SPpH/wbZc7NI5yfYB9IAkhza+YpC+iQ4TJSXVXO/BHhEpmIjOYQmA
	O1bczfEMF2X9J5xjvnxpAn1Z39ewnWwxmgpoBwwhgyCI23tO0ZdEjKTLyg3sOH10pc9CZC1Z5Xg
	qjPYN+/dFFbaklj7X1ubyMIECfgDfcllxj6tRIU=
X-Received: by 2002:a05:701b:2212:b0:120:5719:1852 with SMTP id
 a92af1059eb24-1244b44d299mr107912c88.16.1768584614413; Fri, 16 Jan 2026
 09:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
In-Reply-To: <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 16 Jan 2026 09:30:02 -0800
X-Gm-Features: AZwV_Qg33M1rO31dgikgfsTaot12EQbVpaEnX3TxsJMPXzhkvu_Y-NHzJrI17yU
Message-ID: <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "kernel@xen0n.name" <kernel@xen0n.name>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "david@kernel.org" <david@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jgross@suse.com" <jgross@suse.com>, "surenb@google.com" <surenb@google.com>, "riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "peterx@redhat.com" <peterx@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "ast@kernel.org" <ast@kernel.org>, "vbabka@suse.cz" <vbabka@suse.cz>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "pjw@kernel.org" <pjw@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "willy@infradead.org" <willy@infradead.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, "mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "hpa@zytor.com" <hpa@zytor.com>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "jthoughton@google.com" <jthoughton@google.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, 
 "corbet@lwn.net" <corbet@lwn.net>, "ackerleytng@google.com" <ackerleytng@google.com>, "jannh@google.com" <jannh@google.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_093637_585268_BA55298E 
X-CRM114-Status: GOOD (  24.77  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgMzowNOKAr1BNIEVkZ2Vjb21iZSwgUmljayBQCjxyaWNr
LnAuZWRnZWNvbWJlQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIwMjYtMDEtMTQgYXQg
MTM6NDYgKzAwMDAsIEthbHlhemluLCBOaWtpdGEgd3JvdGU6Cj4gPiBBZGQgR1VFU1RfTUVNRkRf
RkxBR19OT19ESVJFQ1RfTUFQIGZsYWcgZm9yIEtWTV9DUkVBVEVfR1VFU1RfTUVNRkQoKQo+ID4g
aW9jdGwuIFdoZW4gc2V0LCBndWVzdF9tZW1mZCBmb2xpb3Mgd2lsbCBiZSByZW1vdmVkIGZyb20g
dGhlIGRpcmVjdCBtYXAKPiA+IGFmdGVyIHByZXBhcmF0aW9uLCB3aXRoIGRpcmVjdCBtYXAgZW50
cmllcyBvbmx5IHJlc3RvcmVkIHdoZW4gdGhlIGZvbGlvcwo+ID4gYXJlIGZyZWVkLgo+ID4KPiA+
IFRvIGVuc3VyZSB0aGVzZSBmb2xpb3MgZG8gbm90IGVuZCB1cCBpbiBwbGFjZXMgd2hlcmUgdGhl
IGtlcm5lbCBjYW5ub3QKPiA+IGRlYWwgd2l0aCB0aGVtLCBzZXQgQVNfTk9fRElSRUNUX01BUCBv
biB0aGUgZ3Vlc3RfbWVtZmQncyBzdHJ1Y3QKPiA+IGFkZHJlc3Nfc3BhY2UgaWYgR1VFU1RfTUVN
RkRfRkxBR19OT19ESVJFQ1RfTUFQIGlzIHJlcXVlc3RlZC4KPiA+Cj4gPiBOb3RlIHRoYXQgdGhp
cyBmbGFnIGNhdXNlcyByZW1vdmFsIG9mIGRpcmVjdCBtYXAgZW50cmllcyBmb3IgYWxsCj4gPiBn
dWVzdF9tZW1mZCBmb2xpb3MgaW5kZXBlbmRlbnQgb2Ygd2hldGhlciB0aGV5IGFyZSAic2hhcmVk
IiBvciAicHJpdmF0ZSIKPiA+IChhbHRob3VnaCBjdXJyZW50IGd1ZXN0X21lbWZkIG9ubHkgc3Vw
cG9ydHMgZWl0aGVyIGFsbCBmb2xpb3MgaW4gdGhlCj4gPiAic2hhcmVkIiBzdGF0ZSwgb3IgYWxs
IGZvbGlvcyBpbiB0aGUgInByaXZhdGUiIHN0YXRlIGlmCj4gPiBHVUVTVF9NRU1GRF9GTEFHX01N
QVAgaXMgbm90IHNldCkuIFRoZSB1c2VjYXNlIGZvciByZW1vdmluZyBkaXJlY3QgbWFwCj4gPiBl
bnRyaWVzIG9mIGFsc28gdGhlIHNoYXJlZCBwYXJ0cyBvZiBndWVzdF9tZW1mZCBhcmUgYSBzcGVj
aWFsIHR5cGUgb2YKPiA+IG5vbi1Db0NvIFZNIHdoZXJlLCBob3N0IHVzZXJzcGFjZSBpcyB0cnVz
dGVkIHRvIGhhdmUgYWNjZXNzIHRvIGFsbCBvZgo+ID4gZ3Vlc3QgbWVtb3J5LCBidXQgd2hlcmUg
U3BlY3RyZS1zdHlsZSB0cmFuc2llbnQgZXhlY3V0aW9uIGF0dGFja3MKPiA+IHRocm91Z2ggdGhl
IGhvc3Qga2VybmVsJ3MgZGlyZWN0IG1hcCBzaG91bGQgc3RpbGwgYmUgbWl0aWdhdGVkLiAgSW4g
dGhpcwo+ID4gc2V0dXAsIEtWTSByZXRhaW5zIGFjY2VzcyB0byBndWVzdCBtZW1vcnkgdmlhIHVz
ZXJzcGFjZSBtYXBwaW5ncyBvZgo+ID4gZ3Vlc3RfbWVtZmQsIHdoaWNoIGFyZSByZWZsZWN0ZWQg
YmFjayBpbnRvIEtWTSdzIG1lbXNsb3RzIHZpYQo+ID4gdXNlcnNwYWNlX2FkZHIuIFRoaXMgaXMg
bmVlZGVkIGZvciB0aGluZ3MgbGlrZSBNTUlPIGVtdWxhdGlvbiBvbiB4ODZfNjQKPiA+IHRvIHdv
cmsuCj4KPiBURFggZG9lcyBzb21lIGNsZWFyaW5nIGF0IHRoZSBkaXJlY3QgbWFwIG1hcHBpbmcg
Zm9yIHBhZ2VzIHRoYXQgY29tZXMgZnJvbSBnbWVtLAo+IHVzaW5nIGEgc3BlY2lhbCBpbnN0cnVj
dGlvbi4gSXQgYWxzbyBkb2VzIHNvbWUgY2xmbHVzaGluZyBhdCB0aGUgZGlyZWN0IG1hcAo+IGFk
ZHJlc3MgZm9yIHRoZXNlIHBhZ2VzLiBTbyBJIHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBzdXJlIFRE
cyBkb24ndCBwdWxsIGZyb20KPiBnbWVtIGZkcyB3aXRoIHRoaXMgZmxhZy4KCkRpc2FibGluZyB0
aGlzIGZlYXR1cmUgZm9yIFREWCBWTXMgZm9yIG5vdyBzZWVtcyBvay4gSSBhc3N1bWUgVERYIGNv
ZGUKY2FuIGVzdGFibGlzaCB0ZW1wb3JhcnkgbWFwcGluZ3MgdG8gdGhlIHBoeXNpY2FsIG1lbW9y
eSBhbmQgdGhlcmVmb3JlCmRvZXNuJ3QgbmVjZXNzYXJpbHkgaGF2ZSB0byByZWx5IG9uIGRpcmVj
dCBtYXAuCgpJcyBpdCBzYWZlIHRvIHNheSB0aGF0IHdlIGNhbiByZW1vdmUgZGlyZWN0IG1hcCBm
b3IgZ3Vlc3QgbWVtb3J5IGZvcgpURFggVk1zIChhbmQgaWRlYWxseSBvdGhlciBDQyBWTXMgYXMg
d2VsbCkgaW4gZnV0dXJlIGFzIG5lZWRlZD8KCj4KPiBOb3QgdGhhdCB0aGVyZSB3b3VsZCBiZSBh
bnkgZXhwZWN0ZWQgdXNlIG9mIHRoZSBmbGFnIGZvciBURHMsIGJ1dCBpdCBjb3VsZCBjYXVzZQo+
IGEgY3Jhc2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
