Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF26CA6017
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F54QWs/fyPTQM22axfnnq4MC1LGbmxLr6xqCUBFDDt0=; b=IyKKpcTLWUS0ho
	aven0FIQrnij0AE9FZ4L4DEbQwyJhPMvook2UWkLzGb+jnS6GYWuVBmwRBXMFysWrMjeKp8TRnro7
	KFD8mE+7/QLzQOXNhGmnSTTpMu9WPF2LtOumeZmCBOieeu0JG1LlWDZGrAaQ3kPod7LNQNVN/a+cM
	WFEb6ZLYy3irH40sptujX8bEDaD0CYU8g+zt6/CQaLYycPeFqKfqL8WE+4VLSAdPGZfw2/8pACcEe
	GrKLZBM20IpbK3R/oG4pvU67ps6EJECOKnLqCzFgNUdMIIEhVOz/s+XrkhxEbpcut6/5W2TQtKTPa
	Ndr4VNa+XUv/pG24XG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFRia-00000007c99-07Xa;
	Sat, 10 Oct 2026 07:42:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFRiX-00000007c8K-1GWE
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 07:42:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-487049569b6so262329f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 00:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791618123; cv=none;
        d=google.com; s=arc-20260327;
        b=aNSPdo8/2KiyZma1eBij0IzG7BlkkisvNT/KCdidOn4QiE3xhYhMKn9QPJZqvJJ694
         psiNRGgEhwqvp69bvGWTxj/Vc3puHX0HiaTw6YjgNkRC9zx4R4+XmOgdSrvRB5hJXLHk
         AfvX0CcdB8r34d9F6tf2AXDoQG8GegcZgOdAa4sie917Hhmhuz+3fWTxnbEcSfYESQRl
         o2ta/wzH7DDjmd6TnMyWPxPQYRB6ccQ9QpxGmHjIUKHvLeqbkPCdT/ZfBthjDZVuiCMt
         fQhH053F22eiG7rqTt+8hGXfpMB2nRZyS+CowmDXcfIdZkBtXZ6U9RYNqyvI8D9xhDVc
         7lTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCywv9S23B5H539wqDzYaEMewRr3bUq+EMOyebbIFcQ=;
        fh=S+h16Fljq27mqBRUNkWYmB4jUSlJ19E8W15FP+VchCo=;
        b=kwOI6RWx7S5trvmuX4SyEnClS3d7tpYAhWqdSubl+30Bz9V9IwJGYtb7YstGLtIkDJ
         X0pAxordV9gWblbwTaWqVLvsTfCeipv2hlTFNSNDgJTaLp6IAB+9lgFFS5bJJ8l7Fbyy
         o6oEct1Prg3VFgUxHktbhcyvHbMnfBskwAKpfYlbj356xuieC8++2or5b2AsXZkYCMIm
         W99W+LMbE2mIZMTL3CkSg2cw4UVe8wqO1GUZglUXJECR79ZdyRiiPozmRlUDPY2CZekx
         f/u+UYJ4KWU3AOlk85k17fUd95dl8m+i6rC3YfmSk/sQ7nVLgMQUKWD4KqEatBB2d9FL
         HaqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791618123; x=1792222923; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCywv9S23B5H539wqDzYaEMewRr3bUq+EMOyebbIFcQ=;
        b=WmS+ga8y9FcnRKsSFY8O+mrYALxbHF/ZuDnGhjkccGo6BuZbb5JccAe/FeCLX+Sy+2
         A1NdfnIkYQZuXCpyOa5/ba0ZBz6I5Pect122jbAAqRDhusg+6wyw+0ppvnO9VgtgfSoE
         FYqPeg4fiGcPgW7QbhXkggGsuLWWDGGZQuZUUIQqOZBcHCz04iiXGYig5UpUjWNFgYZE
         RJI3gW2Nx+00eHfJBFv24jEyUGqXfHeiAjh/bzwTiP68F54cFyFrwGhorNbxlIul2d8J
         o4SL/fjhLR0G0LFVvCp3RHWAyHVc2pu1GF4aU7NLbNqFYh2ew7mp3QUkm0p75Sn6hIFC
         kGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791618123; x=1792222923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCywv9S23B5H539wqDzYaEMewRr3bUq+EMOyebbIFcQ=;
        b=mGAHUKyNd1soq/BoZ0dsTcgsHlYJ5vEbGjDPqr40ZkQC+YOyEHs1zudCSGFOZiKZCe
         ZzWbMtEuzcnFsrr8dknyYx8Pk5RWAB58aQNHhB+DyLJZ+jsGx8h2+F0ES4NhA4kX7TeO
         ooDgllVbjKEGnVdDiABw1AGshxsr9njrGET1Yp9f8PbafcLnUC8qG3Yy9ghPcnk1+Gsg
         cOBubCbaDDG/Zo0qAj98Jqr92NzxhhcHJP4cSSm/cPN6x53nD3ek/GzrPHccZACgBPCw
         P4qxkrVRCZDpP1h2CyNQyscPxHOxadPywM0AJdKLWmM/bRlPRVVF6jrjoXNyNWxFSS4n
         1LGg==
X-Forwarded-Encrypted: i=1; AKwUvBx0wiTX/rlcZHOoEZVxKCuxuiuXmiND603F96DeZeQTB8AbARzL5NsfKma5BzrMdYk2KhIyLrUzvRSwEw==@lists.infradead.org
X-Gm-Message-State: AFq9FYL2rFP9fjqcKeIkZzC6cQViTgiaSX3KLukHaXxdjOI6kaqDKnG6
	whrCJ7dG3dFsaBaFL1EMM4byoFy59kMXjvfKyo6Ce0PvLUxMQr3Zd2CojDRmwLYqXNzK3qVOX9s
	BHBX0Uw9aLbvcX2r2fkqksTDDpmu+601bku3mEWPQeQ==
X-Gm-Gg: AYBFou0N70k6dlNsCJH/4Fzrlrt9Vc2YB3vNa9oHJxUCTZlmGWkDdAtCusMzHLu7wuA
	JU/sg1k1l0DylJxpDI3VNDG6dl43Z+B9ESztoZkJKX1QTnMJvjR1gT0wOQavNzaWwSzQlL1y2/J
	AhzlpoxDUSPgy/1dcvhe7Q1toAd33pcMp28yFftDEvjXLOrG5NCjSXBx4Z/pQqudxv9vjJ6VKkB
	gBU7Tbj7uBkNvf+ER2TxdBfAq6AC2irwUgDubIr8ADsRavyRSYQAwp2Lab2cjp9vUWpZCiqXpGR
	7KA2lWU18owcI9nIJKsYSML9Z5wFwMRFBFvGSXG/Vsorbph8T+nHmVRwUxCFKnOw6a1pGBaQYNb
	Ow2TngBxrZUCk4HzBEQOxycNlhy9jTLcS9FpzXtOJOGqy/PpstLe1zwATh7yTnSq1BePdzZwVsf
	OVeNGXt6uU
X-Received: by 2002:a05:6000:2589:b0:487:218b:bbb0 with SMTP id
 ffacd0b85a97d-48dbace804bmr7344901f8f.42.1791618122986; Sat, 10 Oct 2026
 00:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Oct 2026 09:41:51 +0200
X-Gm-Features: AclHuK9QWngkeEhzbFvhRp9fejpKyh1bo8KVOKD4O89AFCZfZ54-3_jc6EqtE_s
Message-ID: <CAAhSdy1d-hW8Kj1rFEjfY_Q24j+V5N9tXciUcY36nMmkrUNKiA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix build with vector support disabled
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andy Chiu <tchiu@tenstorrent.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_004205_409278_024E3D18 
X-CRM114-Status: GOOD (  18.24  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgNDoxOOKAr0FNIFpoYW5wZW5nIFpoYW5nCjx6aGFuZ3po
YW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFRoZSBrZXJuZWwtbW9kZSB2
ZWN0b3IgY29udGV4dCBoYW5kbGluZyBhZGRlZCB1bmNvbmRpdGlvbmFsIGNhbGxzIHRvCj4gZ2V0
X2NwdV92ZWN0b3JfY29udGV4dCgpLCBwdXRfY3B1X3ZlY3Rvcl9jb250ZXh0KCkgYW5kCj4gX19r
dm1fcmlzY3ZfdmVjdG9yX3Jlc3RvcmUoKSBpbiB2Y3B1LmMuIFdpdGggQ09ORklHX1JJU0NWX0lT
QV9WPW4sIHRoZXNlCj4gY2FsbHMgZmFpbCB0byBidWlsZCBkdWUgdG8gbWlzc2luZyBkZWNsYXJh
dGlvbnMuCj4KPiBUaGUgZ2V0L3B1dCBoZWxwZXJzIGFscmVhZHkgaGF2ZSBuby1vcCBkZWZpbml0
aW9ucyBpbiBhc20vdmVjdG9yLmgsIGJ1dAo+IGt2bV92Y3B1X3ZlY3Rvci5oIG9ubHkgaW5jbHVk
ZXMgdGhhdCBoZWFkZXIgd2hlbiBDT05GSUdfUklTQ1ZfSVNBX1YgaXMKPiBlbmFibGVkLiBJbmNs
dWRlIGl0IHVuY29uZGl0aW9uYWxseSBhbmQgcHJvdmlkZSBhIG5vLW9wIGltcGxlbWVudGF0aW9u
Cj4gb2YgX19rdm1fcmlzY3ZfdmVjdG9yX3Jlc3RvcmUoKSBmb3IgdGhlIGRpc2FibGVkIGNvbmZp
Z3VyYXRpb24sIG1hdGNoaW5nCj4gdGhlIG90aGVyIHZlY3RvciBjb250ZXh0IGhlbHBlcnMuCj4K
PiBUaGUgcGF0aHMgdGhhdCBzZXQgUklTQ1ZfVl9WQ1BVX05FRURfUkVTVE9SRSBhcmUgY29tcGls
ZWQgb3V0IHdoZW4gdmVjdG9yCj4gc3VwcG9ydCBpcyBkaXNhYmxlZCwgc28gdGhlIHJlc3RvcmUg
c3R1YiBkb2VzIG5vdCBkaXNjYXJkIGFueSBsaXZlCj4gdmVjdG9yIHN0YXRlLiBLZWVwIGl0IF9f
YWx3YXlzX2lubGluZSBmb3IgaXRzIG5vaW5zdHIgY2FsbGVyLiBUaGUgdmVjdG9yCj4gZW5hYmxl
ZCBpbXBsZW1lbnRhdGlvbiBpcyB1bmNoYW5nZWQuCj4KPiBGaXhlczogYjUwNjBhNGFhMzNkICgi
UklTQy1WOiBLVk06IGZpeCB2Y3B1IHZlY3RvciBjb250ZXh0IGhhbmRsaW5nIGZvciBrZXJuZWwt
bW9kZSB2ZWN0b3IiKQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5wZW5nIFpoYW5nIDx6aGFuZ3poYW5w
ZW5nLmphc3BlckBieXRlZGFuY2UuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuNAoK
VGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92
ZWN0b3IuaCB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92
Y3B1X3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaAo+
IGluZGV4IDYzNzFkNWVhNTM5Mi4uNTBkNDc4OWI5Y2FjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X3ZlY3Rvci5oCj4gQEAgLTExLDkgKzExLDkgQEAKPiAgI2RlZmluZSBf
X0tWTV9WQ1BVX1JJU0NWX1ZFQ1RPUl9ICj4KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4g
KyNpbmNsdWRlIDxhc20vdmVjdG9yLmg+Cj4KPiAgI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgo+
IC0jaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV9ob3N0Lmg+Cj4K
PiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fa3ZtX3Jpc2N2X3ZlY3Rvcl9zYXZlKHN0
cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNvbnRleHQpCj4gQEAgLTU1LDYgKzU1LDEwIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBrdm1fcmlzY3Zfdl9leGl0KHZvaWQpCj4KPiAgc3RydWN0IGt2bV9jcHVf
Y29udGV4dDsKPgo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19rdm1fcmlzY3ZfdmVj
dG9yX3Jlc3RvcmUoc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY29udGV4dCkKPiArewo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfdmVjdG9yX3Jlc2V0KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICB9Cj4KPiBiYXNlLWNvbW1pdDogOTNmNTE1NzllN2Rm
MjQ4NzgwMjE0MDk0NDE4ZjIwNTI1MzM4M2NjNQo+IC0tCj4gMi41MC4xIChBcHBsZSBHaXQtMTU1
KQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
