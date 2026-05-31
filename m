Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF778CD6E52
	for <linux-riscv@archiver.kernel.org>; Sun, 31 May 2026 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4u9ialIskCU3B5JFMY1aQhi7mwr9Jp13M+CBChrO+M=; b=hqgPBFBazz062J
	KTngYrrcCYmNn2OIQRQUKvq7k+MgnjzVkapSg7cbbWhxZ+q7I7VuTCyPdk2sYqtDYBmoH2h3cxDE+
	HhTSYa3vxfG2s/pEDPWejui8r+sl94To7j3kupidkK8o7T1pqz0cTuPSoO3RAAo0Hbw9YBg/kmOA0
	B5QZUzrfTcDt/T/mgIjFLHDcuBJNLWppfjqdRlaWkrwOknGO1dCl7jTa9czNjPoSyYTOoeGlGO++L
	Ty+2JfwKQ+ZPoG4Mnp1GVlnq0tkPsUP0cCxaDrXGEWy3Hiyu6556J+KtsI3H9vBbbUdh25AOvp7G0
	iw4rmWsfetn5kLF9PKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThoX-00000009fsr-2LdX;
	Sun, 31 May 2026 15:10:57 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThoT-00000009fsB-26VF
	for linux-riscv@lists.infradead.org;
	Sun, 31 May 2026 15:10:55 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69e1eae4eb4so427813eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 31 May 2026 08:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780240252; cv=none;
        d=google.com; s=arc-20240605;
        b=jjzchG9nXiJRLKNTdp6adxICZct2TNYYmVp0bgOSrPaGT75RVlcrp1IE5/sG59BdCd
         r6vEns0AxNZs8y70rfMG2m+7CfB9sU0XTgGmtGLizkcXftSsnD0Jd+AeKSltkv7Zb46M
         tQfqvcYgvfNJuATTFDVxb6WEepoR1NGwYt+VaWiedcIdQCaOlmzFWSMoQCy/xdTa/4n7
         +rNB+MiPv09swdXaI3hsy+kBnkjZUQ5kgQf63lA+dtuy/LAzJZrAeXpIDnO/JxxcxViZ
         WGeAx9QiF78Kux8VRk3icY5U/dc+ipooMHHDweNQBFXP6rdMqtMYGy0nf9z+RYogubv8
         W36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bdZCVhEgQOhgz7irK0pHZdssXKMhcpXPjOMZKGA5lkg=;
        fh=3tKhj1aXJe30uAjMyIOJouGEY6EkFSfKiyV/jYUJSQk=;
        b=hXzKpUSZk16V2jXzSYefdTlUhG3sQ8B6Uu65B6ax5VSHJhtoRQD8Opu5FOSzvB9Zz1
         OifG/00PJ6q1w80l/C/EQ7NODprjZLueRU1U9eXdse7GnunKAkvO1dqcSdsMJ5PgkTSM
         u7lf0O1IEz4ucg6IOMDUzB2ct5T4vuT0S27esFvq1FHGHTgP2IXjNpPy2ogZWNSQMUSp
         vq9s/NsYRhejGt/Pa23gvdwWk8GtzaeTQn9UCYPngt1B7/Nz7ghCkDOunWQyXjfEL6zU
         pdNfytBjeT8B7olTSaxG84jyUg5kgr1ricQugu44NBSwr6jKlkIPLyYsxl6J66mmTVra
         FPLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780240252; x=1780845052; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdZCVhEgQOhgz7irK0pHZdssXKMhcpXPjOMZKGA5lkg=;
        b=qXqf/0dgYz+bqbEFzvDHjeA7zFx0ItmZXymrWdNxBOpZF3l0mSDgQnsOtOqWp6deYA
         kDf35eOLkvduHJStaKZGuA0kQnNRT/im0lc0ZurL4tGYsrH/FY7HV/W4AY3dqGfvVs4z
         jSx0XSWQbRJwbc5tP8qTfwJyRJePNxn5BkCOWHPznGuX+8jYDoJAqgqfiE6EyTHf040q
         2+/o5KO0KubSDMAIhyx7tq6TQd/ZVr+0sH0vpmg/AMnRsPUExOLlu0X5EcImUhoeZ1Le
         +c0PVM3Aja5dqWMrXPPMQ6f6kx9Ya7ZnmQCjv0bTSKS/b93J6KOJCkKmdV86N2bUCovj
         84LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780240252; x=1780845052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdZCVhEgQOhgz7irK0pHZdssXKMhcpXPjOMZKGA5lkg=;
        b=rXG3PznIUr2EaRJX2ZW8LPgXd6p2zQxM6XE3WfwXrvQX1X2bsg3dPonavptkaVL7kA
         uNlREEnGYqrHvgr4viZcHPiw8BhAe2hITWkERaXN9QCLa/IF44KOV1zrE6JYbTWzym8n
         aplpWmriATe6S7UPc5Eh7UP3/bPWh75wXAEUhVR6w5wF9z6lQdTmyW7QK6sGxIlgUpQZ
         yXRhgGZzowJy/tvnvWWpcIZHdmq/ik+1gQCyVnoTffpfkJdRMrMmnX17dILO6QBfm7F4
         MPDROJfbDkDxahrB/6ITrJULpLw7JWMQUa0LwTqyXhDCKqZnp7dXQtmS23Mmfhfq4cqh
         3nqg==
X-Forwarded-Encrypted: i=1; AFNElJ9/1KMyuNMsMTgNtdoIS14fohsQt4sQqVzEO6Hq68yIiUt4eXBl5AANX/jxp85V1IR14RLsJpPZ2uESug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7QdAZKzFV7abm9clgOnqpJ214jx9hIl2VkZ74IR8pMWfguBeo
	JZdH5XSI72FwhtxT+J7XhrrsSBdGGedN68aQGnly/QiW89fT29N1Qb8hyUYdEooFhU32u6ct5Ii
	sZ0sDB0kz6niF6EWSsKr1JOoGlRPQ12kYUGa/wmssjQ==
X-Gm-Gg: Acq92OFP/u0tfSsan85XRJQfaVO594p6a+ucz+u7Dqu5GwU+0G0GQs4RjSszRXgIOJ9
	BBL+QT4UBnY7ceqDhDLepme8vUjZwooHrWd13BxAxS6MW3xLOlGS26GljNDuOy6JsnI2H9p+0cN
	iomLM4MffE0dhqX7XNNuZtTWbK1gPdBO02sL7wWhA6aR1WLnTxVdrVG/id/IrYkgTwdaItzBWIN
	I6Yp8Yn1PyUVyrjp04FcYaJK2n8ZtEjjQOdqkkZU0JxM9S7MJJN0Msl+XJFEn05/9w/11vknv/1
	K/lKZR5eWFELG5luc0nj7qhngjfQ4GyQB/S5JCBbexA2RPt/lPjxTif9dPSX/+/s+587AX7jzAf
	fpSiGb0+mXy6YXbMsxLFscAiQ2w4KrFoGzo7Q9A==
X-Received: by 2002:a05:6820:8c8:b0:69d:9b0a:bf8a with SMTP id
 006d021491bc7-69e10405f06mr3644904eaf.46.1780240251800; Sun, 31 May 2026
 08:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260525094945.3721783-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260525094945.3721783-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 31 May 2026 20:40:40 +0530
X-Gm-Features: AVHnY4LvhtY5JdkqVSNebuIYrOc1ssW4cm3YLUbYzFnlCcU5uLzs500fJwz5LYU
Message-ID: <CAAhSdy31hjQq4mt2J-eQSoQUycSFqwgg6KnMvY-68ZQX-viOTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RISC-V: KVM: Convert HGEI management to fully per-HART
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_081053_820158_8D0A6A01 
X-CRM114-Status: GOOD (  18.81  )
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMzoxOeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1P
IEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4KPiBUaGlzIHNob3J0IHNlcmllcyBjb252
ZXJ0cyBSSVNDLVYgS1ZNIEFJQSdzIEh5cGVydmlzb3IgR3Vlc3QgRXh0ZXJuYWwKPiBJbnRlcnJ1
cHQgKEhHRUkpIGxpbmUgbWFuYWdlbWVudCBmcm9tIGEgZ2xvYmFsICJvbmUtc2l6ZS1maXRzLWFs
bCIKPiBtb2RlbCB0byBhIGZ1bGx5IHBlci1IQVJUIChwZXItQ1BVKSBtb2RlbC4gSXQgYWxzbyBw
ZXJmb3JtcyB0aGUKPiBjb3JyZXNwb25kaW5nIGNoYW5nZXMgaW4gdGhlIElNU0lDIGlycWNoaXAg
ZHJpdmVyLgo+Cj4gVGhlIG1vdGl2YXRpb24gaXMgdG8gcHJvcGVybHkgc3VwcG9ydCBoZXRlcm9n
ZW5lb3VzIFJJU0MtViBTb0NzCj4gKGJpZy5MSVRUTEUsIG11bHRpLXZlbmRvciBjb3JlIG1peGVz
KSB3aGVyZSBkaWZmZXJlbnQgSEFSVHMgbWF5Cj4gZXhwb3NlIGRpZmZlcmVudCBudW1iZXJzIG9m
IGd1ZXN0IGludGVycnVwdCBmaWxlcyAvIEhHRUlFIGJpdHMuCj4KPiBBZnRlciB0aGlzIHNlcmll
cywgSEdFSSBhbGxvY2F0aW9uLCBmcmVlaW5nLCBhbmQgaW50ZXJydXB0IGRlbGl2ZXJ5Cj4gYXJl
IGNvbXBsZXRlbHkgcGVyLUhBUlQgYW5kIHRoZXJlIGFyZSBubyByZW1haW5pbmcgZ2xvYmFsIGFz
c3VtcHRpb25zCj4gYWJvdXQgbnVtYmVyIG9mIGd1ZXN0IGludGVycnVwdCBmaWxlcy4KPgo+IENo
YW5nZWxvZzoKPiBWNToKPiAgLSBBdm9pZCByZS1pbml0aWFsaXppbmcgaGdjdHJsLT5sb2NrIGlu
IGt2bV9yaXNjdl9haWFfZW5hYmxlKCkKPiAgLSBTZXR1cCBmcmVlX2JpdG1hcCBvbmx5IG9uY2Ug
aW4ga3ZtX3Jpc2N2X2FpYV9lbmFibGUoKQo+ICAtIE1ha2Uga3ZtX3Jpc2N2X2FpYV9ucl9oZ2Vp
IHNvIHRoYXQgaXQgY2FuIGJlIGNvbmN1cnJlbnRseQo+ICAgIHVwZGF0ZWQgZnJvbSBrdm1fcmlz
Y3ZfYWlhX2VuYWJsZSgpCj4KPiBWNDoKPiAgLSBEb24ndCBtb2RpZnkga3ZtX3Jpc2N2X2FpYV9u
cl9oZ2VpIGluIGt2bV9yaXNjdl9haWFfZW5hYmxlKCkKPiAgICBzaW5jZSB3ZSB1c2Uga3ZtX3Jp
c2N2X2FpYV9ucl9oZ2VpIG1vc3RseSBmb3IgSEdFSSBlbmFibGUvZGlzYWJsZQo+ICAgIGNoZWNr
cy4KPiAgLSBVc2UgR0VOTUFTS19VTEwoKSBpbnN0ZWFkIG9mIGBCSVQoaGdjdHJsLT5ucl9oZ2Vp
ICsgMSkgLSAxYAo+ICAtIEFsd2F5cyBzZXR1cCBTR0VJIGludGVycnVwdCBpcnJlc3BlY3RpdmUg
b2Yga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpCj4KPiBWMzoKPiAgLSBNb3ZlIFBBVENIMyBhcyBmaXJz
dCBwYXRjaCBhbmQga2VwdCB0aGUgbnJfZ3Vlc3RfZmlsZXMgaW4KPiAgICBnbG9iYWwgY29uZmln
IGFzIHRoZSBudW1iZXIgb2YgZ3Vlc3QgZmlsZXMgYWNyb3NzIGFsbCBDUFVzCj4gIC0gRHJvcGVk
IG9yaWdpbmFsIFBBVENIMiBhbmQgc3F1YXNoZWQgb3JpZ2luYWwgUEFUQ0g0IGludG8KPiAgICBv
cmlnaW5hbCBQQVRDSDEgd2hpY2ggaXMgbm93IFBBVENIMi4KPiAgLSBBZGRyZXNzZWQgY29tbWVu
dHMgaW4gb3JpZ2luYWwgUEFUQ0gxLgo+Cj4gVjI6Cj4gIC0gQWRkIHBlci1IQVJUIElNU0lDIGd1
ZXN0IGZpbGVzIHRvIGNvbXB1dGUgZmluYWwgSEdFSSBjb3VudC4KPiAgLSBBZGQgbWluKGxvY2Fs
LT5ucl9ndWVzdF9maWxlcywgbnJfZ3Vlc3RfZmlsZXMpOwo+Cj4gVjE6Cj4gIC0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcva3ZtLXJpc2N2LzIwMjYwNDIxMTQ1NDUxLjE1OTc5MzAtMS1ndW9yZW5A
a2VybmVsLm9yZy8KPgo+IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSAoMik6Cj4gICBp
cnFjaGlwL3Jpc2N2LWltc2ljOiBBZGQgbnJfZ3Vlc3RfZmlsZXMgaW4gcGVyLUhBUlQgbG9jYWwg
Y29uZmlnCj4gICBSSVNDLVY6IEtWTTogQUlBOiBNYWtlIEhHRUkgbnVtYmVyIG1hbmFnZW1lbnQg
ZnVsbHkgcGVyLUNQVQo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICAgICAg
ICB8ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICAgICAgICB8IDg4
ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5j
ICAgICAgICAgICAgIHwgIDQgKy0KPiAgYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAg
ICAgICAgIHwgIDggKy0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUu
YyB8ICA5ICsrLQo+ICBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCAgICAgfCAg
NSArLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygt
KQo+Cj4gLS0KPiAyLjQzLjAKPgoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC03LjIKClRo
YW5rcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
