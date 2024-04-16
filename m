Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F831C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:MIME-Version:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPpjNuj7P3UYrevx+EOdrTdAJTspi3oCE9PsgL5YXbE=; b=3rAQoC1V1xdFsroOHhfBsL5ftH
	13hARDl6rceSAQg1tvTD4ZO1kkAOd0lazBdlth0y6ry77tFTnY9qF+lNIpzi8cUVBei4HuS4HcahR
	9zcj8aLgjLFDkfKmWYYjQYnANjBD455QEA1xmElGtm/EZaXKgiZQECr7D84NBtqf36K8fsQltaJ/t
	eiuH95Pg25duF2MLddQSSbHQGalGX9QSBfjk6LDAEGMnh7V7As2EXBiUYza9X+c8KIgth2ISR7sDk
	vgCGNi8WIsDSKHcPMNblINGqjtYbqmbUD4RJVg3qOM+Ehzekh348HYyQ9u4HoIa5yPfCeoMM4oY8U
	9v9ZySWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdx9-0000000BPHH-0OBQ;
	Tue, 16 Apr 2024 08:14:07 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdwv-0000000BPBG-405w;
	Tue, 16 Apr 2024 08:14:05 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240416081348euoutp01e986ae0c0420cbaa6fc619f69deca38c~GtI2QdGVB1646716467euoutp01L;
	Tue, 16 Apr 2024 08:13:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240416081348euoutp01e986ae0c0420cbaa6fc619f69deca38c~GtI2QdGVB1646716467euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1713255228;
	bh=bIsb30PZaSLB5OiZcM1+QbJIYYQGcYX6Ld4HuDawoik=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DjfBfnCeczMwC9VGzREMUcny6hjKUIOJoo9UY/piJvcw7sh4r6U0qajsOpPBvf5/a
	 Am3tENqHGcwHVkdAyNnMNbfN0nb5zgR2HXcAz+cdr5eruKji3XZlXhuBFe53cTSFKr
	 W7mDC4fAmyjv0YJa7FWCt6cSAqXOWsc+9rtiMLp4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240416081348eucas1p21cb60b08f416405e6a309e4ef595fa28~GtI1_WOdJ1606116061eucas1p26;
	Tue, 16 Apr 2024 08:13:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id D9.06.09620.B333E166; Tue, 16
	Apr 2024 09:13:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240416081347eucas1p2328252cc35f468c42c0954eaa09d59eb~GtI1f3yuF1895218952eucas1p2U;
	Tue, 16 Apr 2024 08:13:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240416081347eusmtrp140e4080a0a0dac1890e78f8bb14248ff~GtI1dsrEb2457724577eusmtrp1W;
	Tue, 16 Apr 2024 08:13:47 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-a1-661e333b54e0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 18.75.09010.B333E166; Tue, 16
	Apr 2024 09:13:47 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240416081347eusmtip12c7c7c247154a41e8dc385754f42215a~GtI1M5Wo13269232692eusmtip1G;
	Tue, 16 Apr 2024 08:13:47 +0000 (GMT)
Received: from localhost (106.210.248.128) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 16 Apr 2024 09:13:46 +0100
Date: Tue, 16 Apr 2024 09:53:36 +0200
From: Joel Granados <j.granados@samsung.com>
To: Paul Moore <paul@paul-moore.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Muchun Song
	<muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<naoya.horiguchi@nec.com>, John Johansen <john.johansen@canonical.com>,
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Kees Cook <keescook@chromium.org>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Pavel
	Begunkov <asml.silence@gmail.com>, Atish Patra <atishp@atishpatra.org>, Anup
	Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Luis
	Chamberlain <mcgrof@kernel.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<apparmor@lists.ubuntu.com>, <linux-security-module@vger.kernel.org>,
	<keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<io-uring@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/7] security: Remove the now superfluous sentinel
 element from ctl_table array
Message-ID: <20240416075336.stuemtkatjdz4rqe@joelS2.panther.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhT1ykCKnijSbsgPXO9o-5_LHAtSm=q=cdQ8N9QH+WA+tw@mail.gmail.com>
X-Originating-IP: [106.210.248.128]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTfVBUVRjGO/eevXdBgctHcUCzXKQUFGyIPKOSMCrdP/zDoqYxJnODKzDC
	wuyKkdEItNIuH4Igs7au8ikou4EtsCpiEQlCIggkrMQugW7Fp8iHRNtgbBfL/vs97/s8M897
	Zo6QdHlCeQpjJIc5qUQcK6LsoaFloWPTtoA1Bzf/2rcFa6p1FJZPTQpwnVVN49SWIgHWVBoA
	VnSEYq0ph8KaTjnEk2lWiDNHV+PJ4x0Q5y3kAlxVXUrg1tnjFG7PjMN1A2kUVs6fh1h/v1eA
	B80LBG643gZxT72GwmbdEwE2zMgpPJU1TOHzfV0ENuZaAC6/OgRxV2ojwCM9WSROVzvhn/NU
	EHfe6aCxfCAweC2rO6cDbK/iG8gWWNshq07JptgzKV2QHR8ZgWztxXsE+4Nilmavqk00a2j0
	Znuv7WPlNyYEbM/tRFZfqaRY/XQezbaetsK9Hh/Yb4/kYmOOcFL/Nw/YR2dOyImEbKeka3Ny
	IgVMr8wAdkLEvI7qzUoyA9gLXZgLAPW1DVO8mAWoK/Ux5MUMQH+11hBPI/ON3TS/qABo4Pb3
	1L+umeIbAl7UAVSY3QJtEch4o0nDCGljitmIOscH/mE3Zh0qtVQDG5NMoR1q/jrGxq4Mh+aV
	nZSNHZhgpMo9KeDZGbV99QDy/iR0vfn+EguXeBWqWBTa0I55G/2RxfBFvVDacJmA58/Rj7X9
	hK0aYk6tQKbC9OXFLpR71wh5dkWjN2tpnlejW/lZkA/kA/Td4hTNCy1A5alzy2+xDcl/erCc
	CEE5f+oEthaIcUTGCWe+pyPKM6hIfuyAFOkuvPsVpDWPw1zgpX7mMvUzl6n/u4zHDai63v9/
	U5vZF5UXj5E8B6GqqoewCNCVwJ1LlMVFcbIACfeJn0wcJ0uURPlFxMfpwdK/uLV4c+4KuDD6
	yK8JEELQBNYthYcvae8ATyiJl3AiNwe564sHXRwixZ8e5aTxH0kTYzlZE1glhCJ3B+/IlzgX
	Jkp8mDvEcQmc9OmWENp5phDvzEZt3Kr9bZNkopjMnJ0ym77ITl5vfW775SBL6bHwiApLWdDY
	LxEPvUK6Q5nPRkP0ycSXDW2qoaEwUcKezYPRRSWPj5xs1pcwZFpTXfDLpNZpPGil4/r3usL0
	SBYWSM1EtkV/23k3y/joqNKDe0twdj51Q8jg1v72feFKY8GhAxMnnqeNSWaf0/kvSKpMOwfm
	h/yDfUtO0GyY3bvuY9M71vQrM1pnYk7VuJ/dD+5d7rAPf0M4new4/THrI67Z0uMbVBX1amhE
	Q5/zlWiPvTpF/Ic7QsMvWQJ81Wuz2/cPZ2pWuDlfVHkk7vp99zFloDWnSEmY4lRJBbsrFf5N
	ZcXv7+kWQVm0+DUfUioT/w3sC6XnkgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSbUxTVxiAc3pvb1szxl0p41iVQQXNYBRaKB6QEseSefWHDMiybMBYA7eA
	0hb74cY2F8TCgGJWiAbXNcKGhYEEhEAjc4sMFxSElo+AcxQWUDBFRJxExAqs0C0z2b/nvB/P
	++bkZWNcM8Fn5yq1tFopyxMQ2/Bb6zcmw/ZH+ssjOs74IXNrM4H0S4tM1OkysdCp3lomMjdZ
	ASq1vYsuTX5DILNdj6PFIheODPM70WKxDUdVq0aAWlrrGOjmcjGBBgwK1OkoIlDZigVH7XfH
	mejPqVUG+vmXPhyN/mQm0FTzBhNZn+gJtFQxQyDL7WEG+t04C1B91zSOhk91A+QcrcBQickb
	TVRV48g+ZGMhvUNyIJBqvtAMqPHSNpw65xrAKVPhGYL6rnAYpxacTpzqaLzDoK6XLrOoLtMk
	i7J2B1PjVz+k9L89ZFKjgzqqvamMoNr/qmJRN8+78Pe2fySMU6t0WjogR6XRSgWpIiQWimKQ
	UBwVIxRF7kuPFUsE4fFxWXRe7glaHR7/iTDn/rVFLN/g/VlXDa8QLL1SDjhsSEbBle4RVjnY
	xuaSFgBLr/YRnsRO2LY8xvSwD3wxXk54ih4DOL1mwjyPTgAnvl7GN6twMhguWp3YJhPkW9C+
	4NhiHhkE62ZbwWYDRtZw4IOuwS2tD0nDlTL71jgv8gCsNlYyPdZ6DLZ1FgJP4jXY9+29rQkY
	eQL2N/e4rWw374AN6+xN5JBJ8FkF6dl0NyyaufjP1ifhk7U5YAQ+ppdEppdEpv9EnvBe+OLC
	yP/DobD++weYh6WwpeURXgtYTYBH6zSKbIVGLNTIFBqdMluYqVK0A/dpWntXO66AxvnHwh7A
	YIMeEOTunLl8aQjwcaVKSQt4XnqfXXKuV5as4HNarcpQ6/JoTQ+QuH+xEuP7Zqrcd67UZoii
	IySiqOiYCElMdKTAz+tQfqmMS2bLtPQxms6n1f/2MdgcfiGjZuRgdpyjsvaN7csnMx3Pn6XP
	cVPuWn9th0cXDtZZshpe95N4BdhW9xy22YPjGMf0az8MKnM+vciXPsJ2DIWNpHGS/phZOU7a
	05PW/davBDSk7sl2vb+voqVE0ZtQHHtt/5Gze2efHr8/JZYaePKVRE7o6YxkueOGI7ZoY+rj
	8FjX00NBIe8UXLeGGjZWv8q99eVt//w034LGkqW0DNv0wFD887bilIcVvBFHSpOxNbkkskr2
	BU8eVkl3wMRX55x3TGNs/5AsnU9CdbX6vNXCCowXefu+3S8/fMTCT3pzgnfUeU6qTZQuGO71
	X07OEvYOnN7N25UwJk6dPzv945T5g0ABrsmRiUIwtUb2Ny6p+ksvBAAA
X-CMS-MailID: 20240416081347eucas1p2328252cc35f468c42c0954eaa09d59eb
X-Msg-Generator: CA
X-RootMTR: 20240328155911eucas1p23472e0c6505ca73df5c76fe019fdd483
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240328155911eucas1p23472e0c6505ca73df5c76fe019fdd483
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
	<CGME20240328155911eucas1p23472e0c6505ca73df5c76fe019fdd483@eucas1p2.samsung.com>
	<20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
	<20240415134406.5l6ygkl55yvioxgs@joelS2.panther.com>
	<CAHC9VhTE+85xLytWD8LYrmdV8xcXdi-Tygy5fVvokaLCfk9bUQ@mail.gmail.com>
	<CAHC9VhT1ykCKnijSbsgPXO9o-5_LHAtSm=q=cdQ8N9QH+WA+tw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_011354_873307_79DF958F 
X-CRM114-Status: GOOD (  23.35  )
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
Content-Type: multipart/mixed; boundary="===============0160225782712879410=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0160225782712879410==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="zfniyufgrrisfuqi"
Content-Disposition: inline

--zfniyufgrrisfuqi
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 03:02:43PM -0400, Paul Moore wrote:
> On Mon, Apr 15, 2024 at 10:17=E2=80=AFAM Paul Moore <paul@paul-moore.com>=
 wrote:
> > On Mon, Apr 15, 2024 at 9:44=E2=80=AFAM Joel Granados <j.granados@samsu=
ng.com> wrote:
> > >
> > > Hey
> > >
> > > This is the only patch that I have not seen added to the next tree.
> > > I'll put this in the sysctl-next
> > > https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/log=
/?h=3Dsysctl-next
> > > for testing. Please let me know if It is lined up to be upstream thro=
ugh
> > > another path.
> >
> > I was hoping to see some ACKs from the associated LSM maintainers, but
> > it's minor enough I'll go ahead and pull it into the lsm/dev tree this
> > week.  I'll send a note later when I do the merge.
>=20
> ... and now it's merged, it should be in the next cut of the
> linux-next tree.  Thanks!

Awesome. I'll remove it from sysctl-next then to avoid any potential
crashes.

Thx

--=20

Joel Granados

--zfniyufgrrisfuqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmYeLoAACgkQupfNUreW
QU+Ongv9G1IzPsRmO5Fp8LNQGL3RVW2HEJRFRdhkpCF3CIV4X8DYxzsnolosycOY
2BNak77S7o9TcL6MXnhQXS2tS8WNNdo1Yk9lpBb7Y1YlZhkjpXgaVj0lhoJiLskG
tuFbgn+QlMbWUmTPbHcX5Y0ZMp/zA28aWtUEY7b3UD1o7RzOvio6Im7IchVCl3Mw
xFsdxWtgzXO4dEsrwNg8RczshBE2lKLAiHAo5l8/EOw0bvdl8EtWP4wHnDlIWnkQ
p6Ms7mmp/iSOogETWZ9pxejUaZvcnX1mL2TBTAKnsqw9/JNA5vOjgdrP1O37DEs1
iUIVKlY8UqoUBYskAzCfwJFe5O5Unl4Y/hzWTTu0Vq75ZfkD9RN09R/ZUem1NxrZ
5rZ5yYTloIANF7PhUkTmYQKqoNInjtY1m3VUdw9rypOjJQ80cdwOOpYdE5xMS1O9
g+Ad9WDVhpCWhCsjONZ+GrRodtRsMlzOpQEd5HRqFWD8ciyCtWbcHgCBCffWLU0D
R6qovg//
=QO0O
-----END PGP SIGNATURE-----

--zfniyufgrrisfuqi--


--===============0160225782712879410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0160225782712879410==--

